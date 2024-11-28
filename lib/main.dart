import 'package:flutter/material.dart';
import 'package:jovajovajova/screens/job_screen.dart';
import 'package:jovajovajova/screens/job_screen.dart';
import 'package:jovajovajova/screens/main_screen.dart';
import 'package:jovajovajova/screens/myprofile_screen.dart';
import 'package:jovajovajova/screens/notification_screen.dart';
import 'package:jovajovajova/widget/bestwriting_container.dart';

void main(){
  runApp(const Main());
}



class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _Main();
}

class _Main extends State<Main> {

  bool jobofferclick = false;
  bool jobsearchclick = false;
  bool myprofileclick = false;

  void ButtonClickState(bool onclick){
    setState(() {
      onclick = !onclick;
    });
  }

  var _index = 2;

  final List<Widget> _pages = [
    JobScreen(),
    MainScreen(),
    MyprofileScreen(),
    NotificationScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: _pages[_index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            onTap: (value) {
              setState(() {
                _index = value;
              });
            },
            items:const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.explore),label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.campaign),label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: ""),
            ],
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
          )
      ),
    );
  }
}