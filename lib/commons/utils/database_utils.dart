import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DatabaseUtil {
  static Future<void> initDatabase() async {
    Hive.initFlutter();
  }

  static void registerAdapter<Type>(TypeAdapter<Type> adapter) {
    try {
      Hive.registerAdapter(adapter);
    } on HiveError catch (error) {
      debugPrint(error.toString());
    }
  }
}
