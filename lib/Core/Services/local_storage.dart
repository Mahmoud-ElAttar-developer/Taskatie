// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';

class AppLocal {
  static String Image_key = 'Image_key';
  static String Name_key = 'Name_key';
  static String IS_UPLOAD = 'IS_UPLOAD';

  static Future<void> cachData(String key, dynamic value) async {
    var box = Hive.box('user');
    await box.put(key, value);
  }

  static Future<dynamic> getCachedData(String key) async {
    var box = Hive.box('user');
    return await box.get(key);
  }

  static Future<void> removeData(String key) async {
    var box = Hive.box('user');
    await box.delete(key);
  }
}
