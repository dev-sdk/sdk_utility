part of "index.dart";

class Optional<T> {
  final T? _value;

  const Optional._(this._value);

  /// Creates a non-null Optional
  factory Optional.of(T value) {
    if (value == null) {
      throw ArgumentError('Value cannot be null');
    }
    return Optional._(value);
  }

  /// Creates an Optional that may be null
  factory Optional.ofNullable(T? value) => Optional._(value);

  /// Returns an empty Optional
  factory Optional.empty() => Optional._(null);

  /// Checks if value is present (not null)
  bool get isPresent => _value != null;

  /// Checks if value is absent (null)
  bool get isEmpty => _value == null;

  /// Gets the value or throws if empty
  T get value {
    if (_value == null) {
      throw StateError('No value present');
    }
    return _value;
  }

  /// Returns value or [other] if empty
  T orElse(T other) => _value ?? other;

  T? orElseNull([T? other]) => _value ?? other;

  /// Returns value or computes [other] lazily if empty
  T orElseGet(T Function() other) => _value ?? other();

  /// Throws [exceptionSupplier] if value is null
  T orElseThrow(Exception Function() exceptionSupplier) {
    if (_value != null) return _value;
    throw exceptionSupplier();
  }

  /// If value is present, executes [action]
  void ifPresent(void Function(T value) action) {
    if (_value != null) {
      action(_value);
    }
  }

  /// If value is present, executes [action], else executes [emptyAction]
  void ifPresentOrElse(void Function(T value) action, void Function() emptyAction) {
    if (_value != null) {
      action(_value);
    } else {
      emptyAction();
    }
  }

  /// Maps the value if present
  Optional<U> map<U>(U Function(T value) mapper) {
    if (_value != null) {
      return Optional.ofNullable(mapper(_value));
    } else {
      return Optional<U>.empty();
    }
  }

  /// Flat-maps the value if present
  Optional<U> flatMap<U>(Optional<U> Function(T value) mapper) {
    if (_value != null) {
      return mapper(_value);
    } else {
      return Optional<U>.empty();
    }
  }

  /// Returns the same Optional if value matches predicate, else empty
  Optional<T> filter(bool Function(T value) predicate) {
    if (_value != null && predicate(_value)) {
      return this;
    }
    return Optional.empty();
  }

  @override
  String toString() => isPresent ? 'Optional[$_value]' : 'Optional.empty';
}
