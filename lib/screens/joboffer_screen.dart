import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/widget/top_container.dart';
import 'package:jovajovajova/widget/main_backbutton.dart';
import 'package:jovajovajova/widget/job_serach.dart';

class JobofferScreen extends StatefulWidget {
  const JobofferScreen({super.key});

  @override
  State<JobofferScreen> createState() => _JobofferScreenState();
}

class _JobofferScreenState extends State<JobofferScreen> {

  bool jobofferclick = true;
  bool jobsearchclick = false;

  void ButtonClickState(bool onclick){
    setState(() {
      onclick = !onclick;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            TopContainer(),
            Positioned(
                top: 250,
                left: 0,
                child: JobSerach(),
            ),
          ],
        ),
      ),
    );
  }
}
