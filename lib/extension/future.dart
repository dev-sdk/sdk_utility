part of "./index.dart";

extension FutureExtension<T> on Future<T> {
  Future<T> handleFirebaseException() {
    return then((value) => value).catchError((error) {
      if (error is FirebaseException) {
        throw SdkException.find(error.code);
      }
      if (error is SdkException) {
        throw error;
      }

      throw ExceptionConst.unKnown(error.toString());
    });
  }
}
