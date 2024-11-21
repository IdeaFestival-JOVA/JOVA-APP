import 'package:flutter/material.dart';
import 'package:jovajovajova/widget/top_container.dart';
import 'package:jovajovajova/widget/bottom_buttons.dart';
import 'package:jovajovajova/widget/bestwriting_container.dart';
import 'package:jovajovajova/state/nagivator/button_click.dart';

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
        backgroundColor: Colors.grey[300],
        body: Column(
          children: [
            const TopContainer(),
            const BestwritingContainer(title: "조회수가 가장 많은 구인", body: "이런 친구를 굉장히 좋아합니다람쥐ㅇㅇㅇ",post_title: "플러터 개발자",),
            const SizedBox(height: 30),
            const BestwritingContainer(title: "조회수가 가장 많은 구직", body: "하",post_title: "롤로노아 김동현 팀",),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomButtons(
                      icon: const Icon(Icons.person_search),
                      color: false,
                      click: (context) {
                        ButtonActions.jobOfferButton(context);
                        ButtonClickState(jobofferclick);
                        }
                      ),
                  BottomButtons(
                      icon: const Icon(Icons.assignment),
                      color: false,
                      click: (context) {
                        ButtonActions.jobSerachButton(context);
                        ButtonClickState(jobsearchclick);
                      }
                  ),
                  BottomButtons(
                      icon: const Icon(Icons.person),
                      color: false,
                      click: (context) {
                        ButtonActions.myprofileButton(context);
                      }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
