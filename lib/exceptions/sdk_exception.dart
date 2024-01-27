part of './index.dart';

class SdkException implements Exception {
  final String code;
  final String message;
  String? info;

  SdkException(this.code, this.message, {this.info});

  SdkException.save(this.code, this.message, {this.info}) {
    _errorMessages.add(this);
  }

  factory SdkException.saveByCode(ErrorCode errorCode, String message, {String? info}) {
    SdkException exception = SdkException(errorCode.code, message, info: info);
    _errorMessages.add(exception);
    return exception;
  }

  save() {
    _errorMessages.add(this);
    return this;
  }

  @override
  String toString() => 'ResponseException(code: $code, message: $message, info: $info)';

  static final List<SdkException> _errorMessages = List.empty(growable: true);

  static List<SdkException> get getCommonMessages => _errorMessages;

  static SdkException findByCode(ErrorCode code) {
    return _errorMessages.firstWhere(
      (e) => code.code == e.code,
      orElse: () => ExceptionConst.unKnown(code.code),
    );
  }

  static SdkException find(String code) {
    return _errorMessages.firstWhere(
      (e) => code == e.code,
      orElse: () => ExceptionConst.unKnown(code),
    );
  }
}
