import 'package:flutter/material.dart';

class JobWriteProvider extends ChangeNotifier {
  String title = '';
  String mainContent = '';
  
  void updateTitle(String newTitle) {
    title = newTitle;
    notifyListeners();
  }

  void updateMainContent(String newContent) {
    mainContent = newContent;
    notifyListeners();
  }

  bool isFormValid() {
    return title.isNotEmpty && mainContent.isNotEmpty;
  }
}
