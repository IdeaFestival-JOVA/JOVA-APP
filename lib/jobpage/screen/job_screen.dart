import 'package:flutter/material.dart';
import 'package:jovajovajova/provider_class/addpost_provider.dart';
import 'package:provider/provider.dart';
import 'package:jovajovajova/jobpage/screen/job_write_screen.dart';
import 'package:jovajovajova/jobpage/widget/job_list_post.dart';
import 'package:jovajovajova/mainpage/widget/main_appbar.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddpostProvider(),
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(200, 100),
          child: MainAppbar(),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<AddpostProvider>(
            builder: (context, provider, _) {
              return ListView.separated(
                itemCount: provider.getDayList().length,
                itemBuilder: (BuildContext context, int index) {
                  return JobListPost(
                    day: provider.getDayList()[index]!,
                    title: provider.getTitleList()[index],
                    author: provider.getAuthorList()[index],
                    deadline: provider.getDeadlineList()[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Colors.grey,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => JobWriteScreen()),
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
