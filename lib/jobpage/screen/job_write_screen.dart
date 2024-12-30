import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jovajovajova/jobpage/widget/write_appbar.dart';
import 'package:provider/provider.dart';

import '../../provider_class/jobvancacy_post_provider.dart';
import '../../provider_class/jobwrite_provider.dart';
import '../widget/job_write_main.dart';

class JobWriteScreen extends StatefulWidget {
  const JobWriteScreen({super.key});

  @override
  State<JobWriteScreen> createState() => _JobWriteScreenState();
}

class _JobWriteScreenState extends State<JobWriteScreen> {
  @override
  Widget build(BuildContext context) {
    final addpost = Provider.of<AddpostProvider>(context, listen: false);
    final jobWriteProvider = Provider.of<JobWriteProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset:false,
      backgroundColor: Colors.white,
      appBar: WriteAppbar(title: "구인 구직 작성"),
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
                        String formattedDate = DateFormat('yyyy-MM-dd').format(datetime);
                        jobWriteProvider.upadateday(datetime);
                        jobWriteProvider.updateDeadline(formattedDate);
                      }
                    },
                    icon: const Icon(CupertinoIcons.calendar),
                  ),
                  Text("${jobWriteProvider.initialDay.year} - ${jobWriteProvider.initialDay.month} - ${jobWriteProvider.initialDay.day}"),
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
                addpost.sendpostdata(
                    title: jobWriteProvider.title,
                    content: jobWriteProvider.mainContent,
                    category: "BackEnd",
                    author: "황지훈",
                    endsAt: jobWriteProvider.deadline,
                );
                print('테스트 마감 기한${addpost.deadlineList} ${addpost.dayList}');
                jobWriteProvider.title = "";
                jobWriteProvider.mainContent = "";
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
