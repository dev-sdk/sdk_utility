part of '_google_drive_service.dart';

class GoogleConst {
  static const List<String> scopes = [
    'email',
    'https://www.googleapis.com/auth/userinfo.profile',
    "https://www.googleapis.com/auth/drive",
    "https://www.googleapis.com/auth/drive.appdata",
    "https://www.googleapis.com/auth/drive.file",
  ];

  static const String _fileContentType = "application/json";
  static String get getFileContentType => _fileContentType;

  static String _nullCheck(String url, [String? queryParams]) => queryParams == null ? url : "$url?$queryParams";

  static String _googleFileApiUrl([String type = ""]) => "https://www.googleapis.com$type/drive/v3/files";

  static String getGoogleAccessTokenVerificationApiUrl(String accessToken) =>
      'https://www.googleapis.com/oauth2/v3/tokeninfo?access_token=$accessToken';

  static String getGoogleFileApiUrl([String? queryParams]) => _nullCheck(_googleFileApiUrl(), queryParams);

  static String getGoogleFileFetchApiUrl(String fileId) => _nullCheck("${_googleFileApiUrl()}/$fileId", "alt=media");

  static String getGoogleFileUploadApiUrl({String? fileId, String queryParams = 'uploadType=multipart'}) =>
      _nullCheck((_googleFileApiUrl("/upload") + (fileId == null ? "" : "/$fileId")), queryParams);

  static Map<String, String> getApiHeaders(String accessToken, {String? contentType}) {
    Map<String, String> header = {};
    header.putIfAbsent("Authorization", () => "Bearer $accessToken");
    if (contentType != null) header.putIfAbsent("Content-Type", () => contentType);
    return header;
  }

  static final String getBoundary = 'dart-boundary-${DateTime.now().millisecondsSinceEpoch}';

  static String getFileUploadBody(Map<String, Object> metaData, String data) => '''
--$getBoundary
Content-Type: $_fileContentType; charset=UTF-8

${json.encode(metaData)}
--$getBoundary
Content-Type: $_fileContentType

$data
--$getBoundary--
''';
}
