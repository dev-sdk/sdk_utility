part of "./index.dart";

enum SdkExceptionErrorCodes implements ErrorCode {
  weakPassword("weak-password"),
  invalidEmail("invalid-email"),
  emailAlreadyInUse("email-already-in-use"),
  userSignedOut("user-signed-out"),
  userNotFound("user-not-found"),
  unVerifiedEmail("unverified-email"),
  tooManyRequests("too-many-requests"),
  userTokenExpired("user-token-expired"),
  invalidCredential("invalid-credential"),
  internalError("internal-error"),
  userCreation("user-creation-error"),
  userLogin("user-login-error"),
  userNotLogin("user-not-login-error"),
  unKnown("unknown-error"),

  // Custom Exceptions
  listLengthMissMatch("list-length-miss-match"),

  // Google Drive
  accessTokenExpired("access-token-expired"),
  inValidAccessToken("access-token-invalid"),
  folderCreate("folder-create"),
  fileUpload("file-upload"),
  fileListing("file-listing"),
  fileNotFound("file-not-found"),
  fileContent("file-content"),

  ;

  final String code;
  const SdkExceptionErrorCodes(this.code);

  @override
  String getErrorCode() => code;
}
