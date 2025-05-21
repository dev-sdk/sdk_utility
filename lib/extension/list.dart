part of "index.dart";

extension ListExtensions<T> on List<T> {
  /// Returns the first element that satisfies the [test] or null if none found.
  /// print(list.firstWhereOrNull((x) => x > 3));      // 4
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  /// Returns the last element that satisfies the [test] or null if none found.
  ///
  /// print(list.lastWhereOrNull((x) => x < 3));       // 2

  T? lastWhereOrNull(bool Function(T element) test) {
    for (var i = length - 1; i >= 0; i--) {
      if (this[i] != null && test(this[i])) return this[i];
    }
    return null;
  }

  /// Returns true if the list is empty.
  bool get isEmptyOrNull => isEmpty;

  /// Returns true if the list is not empty.
  bool get isNotEmptyOrNull => isNotEmpty;

  /// Returns a new list with only distinct elements based on equality.
  ///
  /// print(list.distinct());                           // [1, 2, 3, 4, 5]
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

  /// Returns the element at [index] or null if index is out of range.
  ///
  /// print(list.elementAtOrNull(10));                  // null
  T? elementAtOrNull(int index) {
    if (index < 0 || index >= length) return null;
    return this[index];
  }

  /// Returns a new list with elements that satisfy the [test].
  ///
  /// print(list.whereNot((x) => x.isEven));            // [1, 3, 5, 3]
  List<T> whereNot(bool Function(T element) test) {
    return where((element) => !test(element)).toList();
  }

  /// Returns the first element or null if the list is empty.
  ///
  /// print(list.firstOrNull);                           // 1
  T? get firstOrNull => isEmpty ? null : this[0];

  /// Returns the last element or null if the list is empty.
  ///
  /// print(list.lastOrNull);                            // 3
  T? get lastOrNull => isEmpty ? null : this[length - 1];

  /// Returns a copy of the list in reversed order.
  ///
  /// print(list.reversedList());                        // [3, 2, 5, 4, 3, 2, 1]
  List<T> reversedList() {
    return reversed.toList();
  }

  /// Returns true if any element satisfies the [test].
  ///
  /// print(list.anyWhere((x) => x == 3));               // true
  bool anyWhere(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return true;
    }
    return false;
  }

  /// Returns true if all elements satisfy the [test].
  ///
  /// print(list.allWhere((x) => x > 0));                // true
  bool allWhere(bool Function(T element) test) {
    for (var element in this) {
      if (!test(element)) return false;
    }
    return true;
  }

  /// Returns a new list by applying [transform] to each element.
  ///
  /// print(list.mapToList((x) => x * 2));               // [2, 4, 6, 8, 10, 4, 6]
  List<R> mapToList<R>(R Function(T element) transform) {
    return map(transform).toList();
  }

  /// Returns the index of the first element that satisfies [test] or -1 if none found.
  ///
  /// print(list.indexWhereOrMinusOne((x) => x == 5));  // 4
  int indexWhereOrMinusOne(bool Function(T element) test) {
    for (int i = 0; i < length; i++) {
      if (test(this[i])) return i;
    }
    return -1;
  }

  /// Returns a new list with elements in random order.
  ///
  /// print(list.shuffledCopy());
  List<T> shuffledCopy() {
    var copy = List<T>.from(this);
    copy.shuffle();
    return copy;
  }
}
