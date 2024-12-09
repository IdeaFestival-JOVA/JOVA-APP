import 'package:flutter/material.dart';

class JobWriteProvider extends ChangeNotifier {
  String title = '';
  String mainContent = '';
  DateTime deadline = DateTime.now();
  
  void updateTitle(String newTitle) {
    title = newTitle;
    notifyListeners();
  }

  void updateMainContent(String newContent) {
    mainContent = newContent;
    notifyListeners();
  }

  void updateDeadline(DateTime newDate) {
    deadline = newDate;
    notifyListeners();
  }

  bool isFormValid() {
    return title.isNotEmpty && mainContent.isNotEmpty;
  }
}
