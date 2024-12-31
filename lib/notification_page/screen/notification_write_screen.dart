import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/provider_class/notification_provider.dart';
import 'package:provider/provider.dart';
import '../../jobpage/widget/job_write_main.dart';
import '../../jobpage/widget/write_appbar.dart';

class NotificationWriteScreen extends StatelessWidget {
  const NotificationWriteScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final notificationProvider = Provider.of<NotificationProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset:false,
      backgroundColor: Colors.white,
      appBar: WriteAppbar(title: "공지 작성(운영자)"),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JobWriteMain(
              controller: TextEditingController(text: notificationProvider.title),
              maxline: 1,
              text: "제목",
              onChanged: (value) {
                notificationProvider.updateTitle(value);
              },
            ),
            const SizedBox(height: 20),
            JobWriteMain(
              controller: TextEditingController(text: notificationProvider.mainContent),
              maxline: 15,
              text: "내용",
              onChanged: (value) {
                notificationProvider.updateMainContent(value);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: notificationProvider.isFormValid()
                  ? () {
                notificationProvider.fetchTokenWithPost();
                notificationProvider.sendpostdata(
                  title: notificationProvider.title,
                  content: notificationProvider.mainContent,
                );
                notificationProvider.title = "";
                notificationProvider.mainContent = "";
                Navigator.pop(context);
              }
                  : null,
              child: const Text("작성하기"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  notificationProvider.isFormValid() ? Colors.green : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
