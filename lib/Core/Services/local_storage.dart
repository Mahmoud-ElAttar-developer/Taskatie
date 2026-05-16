import 'package:hive/hive.dart';

class AppLocal {
  static void cachData(String key, String value) {

    var box = Hive.box('user');
    box.put(key, value);

  }
  static Future<String> getCachedData(String key) async {

    var box = Hive.box('user');
    return await box.get(key);

  }
}