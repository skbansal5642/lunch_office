import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lunch_office/utils/local_shared_preference.dart';

class HomeProvider extends ChangeNotifier {
  List<Map<String, dynamic>> record = [];
  DateTime currentDate = DateTime.now();
  List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'];

  getAllRecords() async {
    // currentDate.
    // String prefKey = '${months[currentDate.month]}-${currentDate.year.toString()}';
    String recordEncodedJson = await LocalSharedPreferences().getRecord();
    if (recordEncodedJson != '') {
      List recordList = jsonDecode(recordEncodedJson);
      for (var element in recordList) {
        Map<String, dynamic> elementMap = element;
        record.add(elementMap);
      }
    }
    notifyListeners();
  }

  addRecord({String newDate = '', required int price, required String entryName}) async {
    if (newDate == '') {
      newDate = "${currentDate.day}/${currentDate.month}/${currentDate.year} ${currentDate.hour}:${currentDate.minute}";
    }

    record.add({
      'entry_name': entryName,
      'date': newDate,
      'price': price,
    });
    notifyListeners();
    LocalSharedPreferences().saveRecord(jsonEncode(record));
  }

  deleteRecord(int index) async {
    record.removeAt(index);
    notifyListeners();
    LocalSharedPreferences().saveRecord(jsonEncode(record));
  }

  int getTotalAmount() {
    int sum = 0;
    for (var element in record) {
      sum += int.parse(element['price'].toString());
    }
    return sum;
  }

  resetRecord() {
    record = [];
    notifyListeners();
    // String prefKey = '${months[currentDate.month]}-${currentDate.year.toString()}';
    LocalSharedPreferences().saveRecord('');
  }
}
