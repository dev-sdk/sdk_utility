part of "./index.dart";

enum FirebaseErrorCodes implements ErrorCode {
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
  ;

  final String code;
  const FirebaseErrorCodes(this.code);

  @override
  String getErrorCode() => code;
}
