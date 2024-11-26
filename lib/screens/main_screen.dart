import 'package:flutter/material.dart';
import 'package:jovajovajova/screens/notification_screen.dart';
import 'package:jovajovajova/widget/bestwriting_container.dart';
import 'job_screen.dart';
import 'myprofile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  bool jobofferclick = false;
  bool jobsearchclick = false;
  bool myprofileclick = false;

  void ButtonClickState(bool onclick){
    setState(() {
      onclick = !onclick;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body:  const Column(
          children: [
            BestwritingContainer(title: "조회수가 가장 많은 구인", body: "이런 친구를 굉장히 좋아합니다람쥐ㅇㅇㅇ",post_title: "플러터 개발자",),
            SizedBox(height: 30),
            BestwritingContainer(title: "조회수가 가장 많은 구직", body: "하",post_title: "롤로노아 김동현 팀",),
          ],
        ),
      ),
    );
  }
}