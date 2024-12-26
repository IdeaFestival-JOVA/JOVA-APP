import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JobWriteProvider extends ChangeNotifier {
  String title = '';
  String mainContent = '';
  String deadline = DateFormat('yyyy-MM-dd').format(DateTime.now());
  DateTime initialDay = DateTime.now();
  
  void updateTitle(String newTitle) {
    title = newTitle;
    notifyListeners();
  }

  void updateMainContent(String newContent) {
    mainContent = newContent;
    notifyListeners();
  }

  void updateDeadline(String newDate) {
    deadline = newDate;
    notifyListeners();
  }

  void upadateday(DateTime newday){
    initialDay = newday;
    notifyListeners();
  }

  bool isFormValid() {
    return title.isNotEmpty && mainContent.isNotEmpty;
  }
}
