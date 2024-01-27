part of './index.dart';

Future createAsyncDelay([int? millSec]) {
  return Future.delayed(Duration(milliseconds: millSec ?? 100));
}
