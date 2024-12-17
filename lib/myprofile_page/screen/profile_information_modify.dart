import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileInformationModify extends StatelessWidget {
  const ProfileInformationModify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.xmark),
        ),
        title: Text(
          "회원정보 수정",
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
    );
  }
}
