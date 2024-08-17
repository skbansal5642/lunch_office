import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSharedPreferences {
  final String prefKey = "record";
  saveRecord(String record) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(prefKey, record);
    String record1 = prefs.getString(prefKey) ?? '';
    debugPrint(record1);
  }

  Future<String> getRecord() async {
    final prefs = await SharedPreferences.getInstance();
    String record = prefs.getString(prefKey) ?? '';
    return record;
  }
}
