part of 'google_drive_service.dart';

class GoogleDriveService extends _GoogleDriveService {
  GoogleDriveService(super._clientId, super._accessToken);

  static List<String> get getScopes => GoogleConst.scopes;
  static String get getScope => getScopes.join(' ');

  String appDataFolder = "appDataFolder";

  String _fileContentType = GoogleConst.getFileContentType;

  String get getFileContentType => _fileContentType;

  set setFileContentType(String type) => _fileContentType = type;

  set updateAccessToken(String token) => _accessToken = token;

  Future<Map<String, dynamic>> verifyToken() {
    return _verifyAccessToken(_accessToken);
  }

  Future<String> getAppDataFolder(String folderName, [bool verifyToken = false]) async {
    if (verifyToken) _verifyAccessToken(_accessToken);
    return _getOrCreateAppFolderId(folderName, appDataFolder, getFileContentType);
  }

  Future<String> saveData(String folderName, String fileName, String content, [bool verifyToken = false]) async {
    if (verifyToken) _verifyAccessToken(_accessToken);
    final folderId = await _getOrCreateAppFolderId(folderName, appDataFolder, getFileContentType);
    return saveDataByFolderId(folderId, fileName, content);
  }

  Future<String> saveDataByFolderId(String folderId, String fileName, String content, [bool verifyToken = false]) async {
    if (verifyToken) _verifyAccessToken(_accessToken);
    return _createOrUpdateFile(folderId, fileName, content);
  }

  Future<String> readData(String folderName, String fileName, [bool verifyToken = false]) async {
    if (verifyToken) _verifyAccessToken(_accessToken);
    final folderId = await _getOrCreateAppFolderId(folderName, appDataFolder, getFileContentType);
    return readDataByFolderId(folderId, fileName);
  }

  Future<String> readDataByFolderId(String folderId, String fileName, [bool verifyToken = false]) async {
    if (verifyToken) _verifyAccessToken(_accessToken);
    return _readFileContent(folderId, fileName);
  }
}
