import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jovajovajova/jobpage/widget/write_appbar.dart';
import 'package:jovajovajova/provider_class/myprofile_provider.dart';
import 'package:provider/provider.dart';

import '../../provider_class/jobvancacy_post_provider.dart';
import '../../provider_class/jobwrite_provider.dart';
import '../widget/job_write_main.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  @override
  Widget build(BuildContext context) {
    final addpost = Provider.of<AddpostProvider>(context, listen: false);
    final jobWriteProvider = Provider.of<JobWriteProvider>(context);
    final myprofile = Provider.of<MyProfile>(context);

    return Scaffold(
      resizeToAvoidBottomInset:false,
      backgroundColor: Colors.white,
      appBar: WriteAppbar(title: "구인 구직 작성"),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                JobWriteMain(
                  controller: TextEditingController(text: jobWriteProvider.title),
                  maxline: 1,
                  text: "제목",
                  onChanged: (value) {
                    jobWriteProvider.title = value;
                    print(jobWriteProvider.title);
                  },
                ),
                const SizedBox(height: 20),
                JobWriteMain(
                  controller: TextEditingController(text: jobWriteProvider.mainContent),
                  maxline: 15,
                  text: "내용",
                  onChanged: (value) {
                    jobWriteProvider.mainContent = value;
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (jobWriteProvider.isFormValid()) {
                  await addpost.fetchTokenWithPost();
                  await addpost.sendpostdata(
                    title: jobWriteProvider.title,
                    content: jobWriteProvider.mainContent,
                    category: 1,
                    author: myprofile.name,
                  );
                  jobWriteProvider.backscreen(context);
                }
              },

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
