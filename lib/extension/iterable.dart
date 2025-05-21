part of "index.dart";

extension IterableExtensions<T> on Iterable<T> {
  /// Returns the first element that satisfies the [test] or null if none found.
  /// Example:
  /// ```dart
  /// print(iterable.firstWhereOrNull((x) => x > 3)); // 4
  /// ```
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  /// Returns the last element that satisfies the [test] or null if none found.
  /// Example:
  /// ```dart
  /// print(iterable.lastWhereOrNull((x) => x < 3));  // 2
  /// ```
  T? lastWhereOrNull(bool Function(T element) test) {
    T? result;
    for (var element in this) {
      if (test(element)) result = element;
    }
    return result;
  }

  /// Returns a new list with only distinct elements based on equality.
  /// Example:
  /// ```dart
  /// print(iterable.distinct()); // [1, 2, 3, 4, 5]
  /// ```
  List<T> distinct() {
    var seen = <T>{};
    var result = <T>[];
    for (var element in this) {
      if (seen.add(element)) {
        result.add(element);
      }
    }
    return result;
  }

  /// Returns a new list with elements that do NOT satisfy the [test].
  /// Example:
  /// ```dart
  /// print(iterable.whereNot((x) => x.isEven)); // [1, 3, 5]
  /// ```
  List<T> whereNot(bool Function(T element) test) {
    return where((element) => !test(element)).toList();
  }

  /// Returns the first element or null if empty.
  /// Example:
  /// ```dart
  /// print(iterable.firstOrNull); // 1
  /// ```
  T? get firstOrNull {
    var it = iterator;
    if (it.moveNext()) {
      return it.current;
    }
    return null;
  }

  /// Returns the last element or null if empty.
  /// Example:
  /// ```dart
  /// print(iterable.lastOrNull); // 3
  /// ```
  T? get lastOrNull {
    T? last;
    bool hasAny = false;
    for (var element in this) {
      last = element;
      hasAny = true;
    }
    return hasAny ? last : null;
  }

  /// Returns true if any element satisfies the [test].
  /// Example:
  /// ```dart
  /// print(iterable.anyWhere((x) => x == 3)); // true
  /// ```
  bool anyWhere(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return true;
    }
    return false;
  }

  /// Returns true if all elements satisfy the [test].
  /// Example:
  /// ```dart
  /// print(iterable.allWhere((x) => x > 0)); // true
  /// ```
  bool allWhere(bool Function(T element) test) {
    for (var element in this) {
      if (!test(element)) return false;
    }
    return true;
  }

  /// Returns a new list by applying [transform] to each element.
  /// Example:
  /// ```dart
  /// print(iterable.mapToList((x) => x * 2)); // [2, 4, 6]
  /// ```
  List<R> mapToList<R>(R Function(T element) transform) {
    return map(transform).toList();
  }

  /// Returns the index of the first element that satisfies [test] or -1 if none found.
  /// Example:
  /// ```dart
  /// print(iterable.indexWhereOrMinusOne((x) => x == 5)); // 4
  /// ```
  int indexWhereOrMinusOne(bool Function(T element) test) {
    int index = 0;
    for (var element in this) {
      if (test(element)) return index;
      index++;
    }
    return -1;
  }

  /// Converts the iterable to a list and returns it shuffled.
  /// Example:
  /// ```dart
  /// print(iterable.shuffledCopy()); // e.g. [3, 2, 1]
  /// ```
  List<T> shuffledCopy() {
    var list = toList();
    list.shuffle();
    return list;
  }

  /// Returns true if iterable is empty.
  /// Example:
  /// ```dart
  /// print(iterable.isEmptyOrNull); // false
  /// ```
  bool get isEmptyOrNull => isEmpty;

  /// Returns true if iterable is not empty.
  /// Example:
  /// ```dart
  /// print(iterable.isNotEmptyOrNull); // true
  /// ```
  bool get isNotEmptyOrNull => isNotEmpty;

  /// Returns a list of all elements except the last one.
  /// Example:
  /// ```dart
  /// print(iterable.dropLast); // [1, 2, 3]
  /// ```
  List<T> get dropLast {
    var list = toList();
    if (list.isEmpty) return [];
    return list.sublist(0, list.length - 1);
  }

  /// Returns a list of all elements except the first one.
  /// Example:
  /// ```dart
  /// print(iterable.dropFirst); // [2, 3, 4]
  /// ```
  List<T> get dropFirst {
    var list = toList();
    if (list.isEmpty) return [];
    return list.sublist(1);
  }
}
