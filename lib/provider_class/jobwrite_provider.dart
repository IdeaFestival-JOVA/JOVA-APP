import 'package:flutter/material.dart';

class JobWriteProvider extends ChangeNotifier {
  String title = '';
  String mainContent = '';

  bool isFormValid() {
    final check = title.isNotEmpty && mainContent.isNotEmpty;
    return check;
  }

  void backscreen(BuildContext context){
    title = "";
    mainContent = "";
    Navigator.pop(context);
  }
}
