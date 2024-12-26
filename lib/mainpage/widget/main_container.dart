import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jovajovajova/model/jobvacancy_list_model.dart';
import 'package:jovajovajova/provider_class/addpost_provider.dart';

import 'list_post_widget.dart';

class MainContainer extends StatelessWidget {
  final String title;

  const MainContainer({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[100],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Consumer<AddpostProvider>(
                builder: (context, provider, _) {
                  return FutureBuilder(
                    future: provider.fetchJobVacancies(),
                    builder: (context, AsyncSnapshot<List<Jobvacancy>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text("${snapshot.error}"),
                        );
                      } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        final jobs = snapshot.data!;
                        return ListView.separated(
                          itemCount: jobs.length > 4 ? 4: jobs.length,
                          itemBuilder: (context, index) {
                            final job = jobs[index];
                            return ListPostWidget(
                              title: job.title,
                              author: job.category,
                              deadline: job.createdAt,
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(),
                        );
                      } else {
                        return const Center(
                          child: Text('No job vacancies available'),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
