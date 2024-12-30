import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/jobpage/screen/write_screen.dart';
import 'package:jovajovajova/mainpage/widget/main_appbar.dart';
import 'package:jovajovajova/model/notification_api.dart';
import 'package:jovajovajova/notification_page/screen/notification_write_screen.dart';
import 'package:jovajovajova/provider_class/notification_provider.dart';
import 'package:provider/provider.dart';

import '../../jobpage/widget/job_list_post.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<NotificationProvider>(
          builder: (context, provider, _) {
            return FutureBuilder(
              future: provider.fetchNotifications(),
              builder: (context,AsyncSnapshot<List<Notification_model>> snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else if(snapshot.hasError){
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                }
                else if(snapshot.hasData && snapshot.data!.isNotEmpty){
                  final jobs = snapshot.data!;
                  return ListView.separated(
                    itemCount: jobs.length,
                    itemBuilder: (context,index) {
                      final job = jobs[index];
                      return JobListPost(
                        title: job.title,
                        author: job.author,
                        deadline: job.createdAt,
                        content: job.content,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  );
                }
                else{
                  return Center(
                    child: Text("값 없음"),
                  );
                }
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.grey[400],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotificationWriteScreen()),
          );
        },
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}