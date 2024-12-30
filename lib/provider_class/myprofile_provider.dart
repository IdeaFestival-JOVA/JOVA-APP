import 'package:flutter/material.dart';

class MyProfile extends ChangeNotifier {
  String name = "이주언";
  String github = "aiden30015";
  String email = "s24068@gsm.hs.kr";

  String tempName = "";
  String tempGithub = "";
  String tempEmail = "";

  bool check(){
    return tempName.isNotEmpty && tempEmail.isNotEmpty;
  }


  void updateName() {
    if (tempName.isNotEmpty) {
      name = tempName;
    }
    notifyListeners();
  }

  void updateGithub() {
    if (tempGithub.isNotEmpty) {
      github = tempGithub;
    }
    notifyListeners();
  }

  void updateEmail() {
    if (tempEmail.isNotEmpty) {
      email = tempEmail;
    }
    notifyListeners();
  }

  void totalupdate(BuildContext context){
    updateEmail();
    updateGithub();
    updateName();
    backscreen(context);
  }


  void backscreen(BuildContext context) {
    tempName = "";
    tempGithub = "";
    tempEmail = "";
    Navigator.pop(context);
  }
}
