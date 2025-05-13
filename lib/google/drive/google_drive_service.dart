import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sdk_utility/sdk_utility.dart';
part 'google_const.dart';

part '_google_drive_service.dart';

abstract class _GoogleDriveService {
  String _accessToken;
  final String _clientId;

  _GoogleDriveService(this._clientId, this._accessToken);

  Future<String> _createCustomAppDataFolder(String folderName, String parent, String contentType) async {
    final uri = Uri.parse(GoogleConst.getGoogleFileApiUrl());
    final body = json.encode({
      'name': folderName,
      'mimeType': 'application/vnd.google-apps.folder',
      'parents': [parent],
    });
    final response = await http.post(uri, headers: GoogleConst.getApiHeaders(_accessToken, contentType: contentType), body: body);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['id'];
    } else {
      throw FolderCreationException(response.body);
    }
  }

  Future<String> _getOrCreateAppFolderId(String folderName, String parent, String contentType) async {
    String? appDataFolderId = await _getFolderId(folderName);
    appDataFolderId ??= await _createCustomAppDataFolder(folderName, parent, contentType);
    return appDataFolderId;
  }

  Future<String?> _getFolderId(String folderName) async {
    final query = "name = '$folderName' and mimeType = 'application/vnd.google-apps.folder' and 'appDataFolder' in parents";
    final response = await http.get(
      Uri.parse(GoogleConst.getGoogleFileApiUrl('q=${Uri.encodeQueryComponent(query)}&spaces=appDataFolder')),
      headers: GoogleConst.getApiHeaders(_accessToken),
    );
    if (response.statusCode == 200) {
      final files = json.decode(response.body)['files'];
      if (files != null && files.isNotEmpty) return files[0]['id'];
    }
    return null;
  }

  Future<String> _uploadJsonFile(String folderId, String fileName, String content, [String? filedId]) async {
    final metadata = {
      'name': fileName,
      'parents': [folderId],
    };
    final uri = Uri.parse(GoogleConst.getGoogleFileUploadApiUrl(fileId: filedId));
    final response = await http.post(
      uri,
      headers: GoogleConst.getApiHeaders(_accessToken, contentType: 'multipart/related; boundary=${GoogleConst.getBoundary}'),
      body: GoogleConst.getFileUploadBody(metadata, content),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw FileUploadException(response.body);
    }
  }

  Future<String> _createOrUpdateFile(String folderId, String fileName, String content) async {
    final query = "name = '$fileName' and '$folderId' in parents";
    final checkResponse = await http.get(
      Uri.parse(GoogleConst.getGoogleFileApiUrl('q=${Uri.encodeQueryComponent(query)}')),
      headers: GoogleConst.getApiHeaders(_accessToken),
    );
    String? fileId;
    if (checkResponse.statusCode == 200) {
      final files = json.decode(checkResponse.body)['files'];
      if (files != null && files.isNotEmpty) fileId = files[0]['id'];
    }
    return _uploadJsonFile(folderId, fileName, content, fileId);
  }

  Future<String> _readFileContent(String folderId, String fileName) async {
    final query = "name='$fileName' and '$folderId' in parents";
    final encodedQuery = Uri.encodeQueryComponent(query);
    final url = Uri.parse(GoogleConst.getGoogleFileApiUrl('q=$encodedQuery&fields=files(id)&spaces=appDataFolder'));
    final response = await http.get(url, headers: GoogleConst.getApiHeaders(_accessToken));
    if (response.statusCode == 200) {
      final files = json.decode(response.body)['files'];
      if (files == null || files.isEmpty) {
        throw FileNotFoundException(fileName);
      }
      final fileId = files[0]['id'];
      final fileResponse = await http.get(Uri.parse(GoogleConst.getGoogleFileFetchApiUrl(fileId)), headers: GoogleConst.getApiHeaders(_accessToken));
      if (fileResponse.statusCode == 200) {
        return fileResponse.body;
      } else {
        throw FileContentException("${fileResponse.statusCode}, ${fileResponse.body}");
      }
    } else {
      throw FileListingException("${response.statusCode}, ${response.body}");
    }
  }

  Future<Map<String, dynamic>> _verifyAccessToken(String accessToken) async {
    final verifyUrl = Uri.parse(GoogleConst.getGoogleAccessTokenVerificationApiUrl(accessToken));
    final response = await http.get(verifyUrl);
    if (response.statusCode == 200) {
      final tokenInfo = json.decode(response.body);
      if (tokenInfo['aud'] != _clientId) {
        throw InValidAccessTokenException();
      }
      return tokenInfo;
    } else {
      throw AccessTokenExpiredException(response.body);
    }
  }
}
