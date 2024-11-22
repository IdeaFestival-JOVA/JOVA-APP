import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/screens/joboffer_screen.dart';
import 'package:jovajovajova/screens/jobsearch_screen.dart';
import 'package:jovajovajova/screens/myprofile_screen.dart';

class Bottomnavigationbar extends StatefulWidget {
  const Bottomnavigationbar({super.key});

  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbar> {
  @override
  Widget build(BuildContext context) {

    var _index = 0;

    List<Widget> _pages = [
      JobofferScreen(),
      JobsearchScreen(),
      MyprofileScreen()
    ];

    return BottomNavigationBar(
      currentIndex: _index,
      onTap: (value) {
        setState(() {
          _index = value;
          print(_index);
        });
      },
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.person_search),label: "구인"),
          BottomNavigationBarItem(icon: Icon(Icons.assignment),label: "구직"),
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "메인 페이지"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "내 정보"),
          BottomNavigationBarItem(icon: Icon(Icons.campaign),label: "공지")
      ],
      selectedItemColor: Colors.purple,
      selectedFontSize: 18,
      unselectedItemColor: Colors.black,
      unselectedFontSize: 12,
    );
  }
}