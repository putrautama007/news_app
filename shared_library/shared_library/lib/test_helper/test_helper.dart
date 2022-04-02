import 'dart:io';

class TestHelper {
  static String readJson(String name) {
    var dir = Directory.current.path;
    if (dir.endsWith('/test')) {
      dir = dir.replaceAll('/test', '');
    }
    return File('$dir/test/$name').readAsStringSync();
  }
}
