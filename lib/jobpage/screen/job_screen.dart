import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jovajovajova/jobpage/screen/job_write_screen.dart';
import 'package:jovajovajova/jobpage/widget/job_list_post.dart';
import 'package:jovajovajova/mainpage/widget/main_appbar.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {

  List<int> day_list = [1,2,3,4,5,6,7,8];

  List<String> title_list = [
    "Iot",
    "Design",
    "Back_End",
    "Front_End",
    "Flutter",
    "ㅇㅇㅇㅇㅇ",
    "ㅇㅇㅇㅇ",
    "ㅇㅇㅇㅇ"
  ];


  List<String> author_list = [
    "김동현",
    "최준영",
    "황지훈",
    "이상혁",
    "이주언",
    "ㅇㅇㅇ",
    "ㅇㅇㅇㅇ",
    "ㅇㅇㅇㅇ",
  ];

  List<String> deadline_list = [
    "2024.1.1",
    "2024.3.13",
    "2024.5.5",
    "2024.4.4",
    "2024.7.29",
    "2024.12.25",
    "14114",
    "141434",
    "4134134"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Padding(
        padding: const EdgeInsets.all(20),
        child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size(200,100),
              child: MainAppbar()
          ),
          backgroundColor: Colors.white,
          body: ListView.separated(
                  itemBuilder: (BuildContext context,int index){
                    return JobListPost(
                      day: day_list[index],
                      title: title_list[index],
                      author: author_list[index],
                      deadline: deadline_list[index],
                    );
                  },
                  itemCount: day_list.length,
                separatorBuilder: (BuildContext context,int index){
                    return const Divider();
                },
              ),
          floatingActionButton: FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: Colors.grey,
            onPressed: (){
                Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => JobWriteScreen())
                );
            },
            child: const Icon(
                Icons.edit,
              color: Colors.white,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        ),
      ),
    );
  }
}
