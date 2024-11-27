import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/widget/main_backbutton.dart';
import 'package:jovajovajova/widget/job_serach.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {

  List<String> post = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: SearchBar(
                  hintText: "검색을 입력하세요",
                )
            ),
          ],
        ),
      ),
    );
  }
}
