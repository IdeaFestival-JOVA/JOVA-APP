import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobWriteScreen extends StatefulWidget {
  const JobWriteScreen({super.key});

  @override
  State<JobWriteScreen> createState() => _JobWriteScreenState();
}

class _JobWriteScreenState extends State<JobWriteScreen> {

  DateTime initialDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(CupertinoIcons.xmark),
          ),
          title: const Text(
              "구인 구직 작성",
            style: TextStyle(
              fontSize: 24
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  hintText: "제목을 입력해주세요",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all()
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed:() async {
                        final DateTime? datetime = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050),
                        );
                        if(datetime != null){
                          setState(() {
                            initialDay = datetime;
                          });
                        }
                      },
                      icon: Icon(CupertinoIcons.calendar),
                    ),
                    Text(
                      "${initialDay.year} - ${initialDay.month} - ${initialDay.day}"
                    ),
                    Text(
                      "마감날짜  ",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
