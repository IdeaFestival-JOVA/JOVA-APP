import 'package:flutter/material.dart';
import 'package:jovajovajova/mainpage/widget/main_appbar.dart';
import 'package:jovajovajova/screens/notification_screen.dart';
import 'package:jovajovajova/screens/search_screen.dart';
import 'package:jovajovajova/mainpage/widget/main_container.dart';
import '../../jobpage/screen/job_screen.dart';
import '../../myprofile_page/screen/myprofile_screen.dart';

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
      home: Padding(
        padding: const EdgeInsets.all(20),
        child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size(200, 100),
              child: MainAppbar(),
          ),
          backgroundColor: Colors.white,
          body:  Column(
            children: [
              Flexible(
                  flex: 3,
                  child: MainContainer(
                    title: "구인구직",
                  ),
              ),
              const SizedBox(height: 30),
              Flexible(
                flex: 3,
                child: MainContainer(
                  title: "공지",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}