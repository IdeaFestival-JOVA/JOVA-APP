import 'package:flutter/material.dart';
import 'package:jovajovajova/mainpage/widget/main_appbar.dart';
import 'package:jovajovajova/mainpage/widget/main_container.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with ChangeNotifier {
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
              const SizedBox(height: 40),
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