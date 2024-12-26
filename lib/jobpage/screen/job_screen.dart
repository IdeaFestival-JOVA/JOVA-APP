import 'package:flutter/material.dart';
import 'package:jovajovajova/main.dart';
import 'package:jovajovajova/model/jobvacancy_list_model.dart';
import 'package:jovajovajova/provider_class/addpost_provider.dart';
import 'package:provider/provider.dart';
import 'package:jovajovajova/jobpage/screen/job_write_screen.dart';
import 'package:jovajovajova/jobpage/widget/job_list_post.dart';
import 'package:jovajovajova/mainpage/widget/main_appbar.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<AddpostProvider>(
          builder: (context, provider, _) {
            return FutureBuilder(
                future: provider.fetchJobVacancies(),
                builder: (context,AsyncSnapshot<List<Jobvacancy>> snapshot){
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
                          day: 1,
                          title: job.title,
                          author: "이주언",
                          deadline: job.createdAt,
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
            MaterialPageRoute(builder: (context) => JobWriteScreen()),
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
