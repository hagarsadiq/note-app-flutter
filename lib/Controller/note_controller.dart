import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteController extends GetxController {
  List<String> notes = [
    'ملاحظة 1',
    'ملاحظة 2',
    'ملاحظة 3',
  ];

  double fontSize = 22;

  void addNote(String note) {
    notes.add(note);
    update();
  }

  void deleteNote(int index) {
    notes.removeAt(index);
    update();
  }

  void changeFontSize(double value) {
    fontSize = value;
    update();
  }

  void toggleLanguage() {
    if (Get.locale == Locale('ar')) {
      Get.updateLocale(Locale('en'));
    } else {
      Get.updateLocale(Locale('ar'));
    }
    Get.forceAppUpdate();
  }
}