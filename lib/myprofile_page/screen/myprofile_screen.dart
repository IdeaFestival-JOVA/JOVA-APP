import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/mainpage/widget/main_appbar.dart';

import '../widget/myprofile_information.dart';

class MyprofileScreen extends StatefulWidget {
  const MyprofileScreen({super.key});

  @override
  State<MyprofileScreen> createState() => _MyprofileScreenState();
}

class _MyprofileScreenState extends State<MyprofileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(200, 80),
            child: MainAppbar()
        ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Column(
            children: [
              Text(
                "마이 페이지",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                ),
              ),
              SizedBox(height: 20,),
              MyprofileInformation(name: "이주언",github: "aiden30015",email: "s24068@gsm.hs.kr",),
            ],
          ),
      ),
      );
  }
}
