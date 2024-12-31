import 'package:flutter/material.dart';
import 'package:jovajovajova/mainpage/widget/main_appbar.dart';
import 'package:jovajovajova/mainpage/widget/main_container.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: const PreferredSize(
              preferredSize: Size(200, 80),
              child: MainAppbar(),
          ),
          backgroundColor: Colors.white,
          body:  Column(
            children: [
              MainContainer(
                title: "구인구직",
                Bool: false,
              ),
              const SizedBox(height: 40),
              MainContainer(
                title: "공지",
                Bool: true,
              ),
            ],
          ),
        ),
      );
  }
}