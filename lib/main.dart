import 'package:flutter/material.dart';
import 'package:jovajovajova/screens/joboffer_screen.dart';
import 'package:jovajovajova/screens/jobsearch_screen.dart';
import 'package:jovajovajova/screens/main_screen.dart';
import 'package:jovajovajova/screens/myprofile_screen.dart';
import 'package:jovajovajova/screens/notification_screen.dart';
import 'package:jovajovajova/widget/top_container.dart';
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

  List<Widget> _pages = [
    JobofferScreen(),
    JobsearchScreen(),
    MainScreen(),
    MyprofileScreen(),
    NotificationScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.grey[300],
          body: _pages[_index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            onTap: (value) {
              setState(() {
                _index = value;
              });
            },
            items:const [
              BottomNavigationBarItem(icon: Icon(Icons.person_search),label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.assignment),label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.campaign),label: "")
            ],
            selectedItemColor: Colors.purple,
            unselectedItemColor: Colors.black,
          )
      ),
    );
  }
}