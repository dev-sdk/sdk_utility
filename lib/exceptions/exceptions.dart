part of "./index.dart";

class LengthMissMatchException extends SdkException {
  LengthMissMatchException() : super.save(SdkExceptionErrorCodes.listLengthMissMatch.code, "Length of two lists are miss matching.");
}
