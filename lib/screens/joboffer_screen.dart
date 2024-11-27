import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/widget/main_backbutton.dart';
import 'package:jovajovajova/widget/job_serach.dart';

class JobofferScreen extends StatefulWidget {
  const JobofferScreen({super.key});

  @override
  State<JobofferScreen> createState() => _JobofferScreenState();
}

class _JobofferScreenState extends State<JobofferScreen> {

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
