import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../provider_class/addpost_provider.dart';
import '../../provider_class/jobwrite_provider.dart';
import '../widget/job_write_main.dart';

class JobWriteScreen extends StatefulWidget {
  const JobWriteScreen({super.key});

  @override
  State<JobWriteScreen> createState() => _JobWriteScreenState();
}

class _JobWriteScreenState extends State<JobWriteScreen> {
  DateTime initialDay = DateTime.now();
  late String formattedDate = DateFormat('yyyy.MM.dd').format(initialDay);

  @override
  Widget build(BuildContext context) {
    final addpost = Provider.of<AddpostProvider>(context, listen: false);
    final jobWriteProvider = Provider.of<JobWriteProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset:false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(CupertinoIcons.xmark),
        ),
        title: const Text(
          "구인 구직 작성",
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JobWriteMain(
              controller: TextEditingController(text: jobWriteProvider.title),
              maxline: 1,
              text: "제목",
              onChanged: (value) {
                jobWriteProvider.updateTitle(value);
              },
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () async {
                      final DateTime? datetime = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2050),
                      );
                      if (datetime != null) {
                        setState(() {
                          initialDay = datetime;
                        });
                        jobWriteProvider.updateDeadline(initialDay);
                      }
                    },
                    icon: const Icon(CupertinoIcons.calendar),
                  ),
                  Text("${initialDay.year} - ${initialDay.month} - ${initialDay.day}"),
                  const Text("마감날짜"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            JobWriteMain(
              controller: TextEditingController(text: jobWriteProvider.mainContent),
              maxline: 15,
              text: "내용",
              onChanged: (value) {
                jobWriteProvider.updateMainContent(value);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: jobWriteProvider.isFormValid()
                  ? () {
                addpost.addJob(
                  day: 1,
                  title: jobWriteProvider.title,
                  author: "황지훈",
                  deadline: formattedDate,
                );
                Navigator.pop(context);
              }
                  : null,
              child: const Text("작성하기"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  jobWriteProvider.isFormValid() ? Colors.green : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
