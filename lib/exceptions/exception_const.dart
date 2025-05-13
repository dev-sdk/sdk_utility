part of "./index.dart";

class ExceptionConst {
  static final SdkException weakPassword = SdkException.saveByCode(SdkExceptionErrorCodes.weakPassword, "The password provided is too weak.");
  static final SdkException invalidEmail = SdkException.saveByCode(SdkExceptionErrorCodes.invalidEmail, "The email entered is Invalid.");
  static final SdkException emailAlreadyInUse =
      SdkException.saveByCode(SdkExceptionErrorCodes.emailAlreadyInUse, "Email you are trying to use is already in use with another account.");
  static final SdkException userSignedOut = SdkException.saveByCode(SdkExceptionErrorCodes.userSignedOut, "User signed out. Please sign-in again.");
  static final SdkException userNotFound = SdkException.saveByCode(SdkExceptionErrorCodes.userNotFound, "User not found with the email.");
  static final SdkException unVerifiedEmail =
      SdkException.saveByCode(SdkExceptionErrorCodes.unVerifiedEmail, "Email is not verified. Please verify your email to continue services.");
  static final SdkException tooManyRequests = SdkException.saveByCode(SdkExceptionErrorCodes.tooManyRequests, "Too many requests received.");
  static final SdkException userTokenExpired = SdkException.saveByCode(
      SdkExceptionErrorCodes.userTokenExpired, "Token expired, please retry after some time. If issue exits please sign=out and login again.");
  static final SdkException invalidCredential =
      SdkException.saveByCode(SdkExceptionErrorCodes.invalidCredential, "The credentials using are invalid. check again and try later.");
  static final SdkException internalError =
      SdkException.saveByCode(SdkExceptionErrorCodes.internalError, "Unknown error occurred. Please try after sometime.");
  static final SdkException userCreation =
      SdkException.saveByCode(SdkExceptionErrorCodes.userCreation, "unable to create user at the moment. please try later.");
  static final SdkException userLogin =
      SdkException.saveByCode(SdkExceptionErrorCodes.userLogin, "unable to Login user at the moment. please try later.");
  static final SdkException userNotLogin = SdkException.saveByCode(SdkExceptionErrorCodes.userNotLogin, "User not signed-in. Try again after login.");
  static SdkException unKnown(String info) => SdkException.saveByCode(SdkExceptionErrorCodes.unKnown, "Unknown Error occurred.", info: info);
}
