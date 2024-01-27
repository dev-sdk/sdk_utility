part of './index.dart';

Future<dynamic> readJsonFile(String path) async {
  final String response = await rootBundle.loadString(path);
  return await json.decode(response);
}

Future createDelay([int? mSec]) async {
  return Future.delayed(Duration(milliseconds: mSec ?? 100));
}
