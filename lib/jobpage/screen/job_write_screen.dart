import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jovajovajova/jobpage/screen/job_screen.dart';
import 'package:jovajovajova/jobpage/widget/job_write_main.dart';

class JobWriteScreen extends StatefulWidget {
  const JobWriteScreen({super.key});

  @override
  State<JobWriteScreen> createState() => _JobWriteScreenState();
}

class _JobWriteScreenState extends State<JobWriteScreen> {

  DateTime initialDay = DateTime.now();
  late String formattedDate = DateFormat('yyyy.MM.dd').format(initialDay);
  TextEditingController title_controller = TextEditingController();
  TextEditingController main_controller = TextEditingController();
  bool isButtonEnabled = false;

  void _updateButtonState() {
    setState(() {
      isButtonEnabled =
          main_controller.text.isNotEmpty && title_controller.text.isNotEmpty;
    });
  }

  @override
  void dispose(){
    main_controller.dispose();
    title_controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    main_controller.addListener(_updateButtonState);
    title_controller.addListener(_updateButtonState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              JobWriteMain(controller: title_controller, maxline: 1,text: "제목",),
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
              SizedBox(height: 20,),
              JobWriteMain(controller: main_controller, maxline: 15,text: "내용",),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    if(isButtonEnabled){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  JobScreen(title: title_controller,author: "익명",deadline: formattedDate,day: 1,)
                          )
                      );
                    }
                    else{
                    }
                  },
                  child: Text(
                    "작성하기"
                  ),
                style: ButtonStyle(
                  backgroundColor:
                  isButtonEnabled ?
                      MaterialStateProperty.all(
                        Colors.green
                      )
                      :
                      MaterialStateProperty.all(
                        Colors.grey
                      )
                ),
              ),
            ],
          ),
        ),
      );
  }
}