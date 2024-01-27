part of './index.dart';

extension StringExtension on String {
  String replaceAllWith(List<String> data) {
    String main = this;
    RegExp regex = RegExp(r"%([^%]+)%");
    Iterable<Match> matches = regex.allMatches(main);

    List<Pattern> extractedItems = matches.map((match) => match.pattern).toList();
    if (data.length < extractedItems.length) throw LengthMissMatchException();
    for (int i = 0; i < extractedItems.length; i++) {
      main = main.replaceFirst(extractedItems[i], data[i]);
    }

    return main;
  }

  /// Order should be with s1, s2 .....
  ///
  /// @example 'change this %s1$ to this $s2$. main is %s1%;'
  String replaceInOrder(List<String> data) {
    String main = this;
    RegExp regex = RegExp(r"%([^%]+)%");
    Iterable<Match> matches = regex.allMatches(main);

    List<String> extractedItems = matches.map((match) => match.group(1)!).toSet().toList();
    extractedItems = _sortedList(extractedItems);
    if (data.length < extractedItems.length) throw LengthMissMatchException();
    for (int i = 0; i < extractedItems.length; i++) {
      main = main.replaceAll("%${extractedItems[i]}%", data[i]);
    }
    return main;
  }

  List<String> _sortedList(List<String> data) {
    data.sort((a, b) {
      int numA = int.parse(a.substring(1));
      int numB = int.parse(b.substring(1));
      return numA.compareTo(numB);
    });
    return data;
  }
}
