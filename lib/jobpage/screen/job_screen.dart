import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/jobpage/screen/job_write_screen.dart';
import 'package:jovajovajova/jobpage/widget/job_list_post.dart';
import 'package:jovajovajova/mainpage/widget/main_appbar.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({
    super.key,
    this.title,
    this.author,
    this.deadline,
    this.day
  });

  final TextEditingController? title;
  final String? author;
  final String? deadline;
  final int? day;

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {

  void addDate(){
    setState(() {
      if(widget.day != null){
        day_list.add(widget.day!);
      }
      if(widget.title != null){
        title_list.add(widget.title!.text);
      }
      if(widget.author != null){
        author_list.add(widget.author!);
      }
      if(widget.deadline != null){
        deadline_list.add(widget.deadline!);
      }
    });
  }


  List<int?> day_list = [1,2,3,4,5,];

  List<String> title_list = [
    "Iot",
    "Design",
    "Back_End",
    "Front_End",
    "Flutter",
  ];


  List<String> author_list = [
    "김동현",
    "최준영",
    "황지훈",
    "이상혁",
    "이주언",
  ];

  List<String> deadline_list = [
    "2024.1.1",
    "2024.3.13",
    "2024.5.5",
    "2024.4.4",
    "2024.7.29",
    "2024.12.25",
  ];

  @override
  void initState(){
    super.initState();
    addDate();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      day: day_list[index]!,
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
      );
  }
}
