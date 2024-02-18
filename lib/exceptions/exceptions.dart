part of "./index.dart";

class LengthMissMatchException extends SdkException {
  LengthMissMatchException() : super.save(FirebaseErrorCodes.listLengthMissMatch.code, "Length of two lists are miss matching.");
}
