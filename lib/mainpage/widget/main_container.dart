import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/mainpage/widget/list_post_widget.dart';
import 'package:jovajovajova/provider_class/addpost_provider.dart';
import 'package:jovajovajova/provider_class/jobwrite_provider.dart';
import 'package:provider/provider.dart';

class MainContainer extends StatelessWidget {
  final String title;

  MainContainer({
    super.key,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => JobWriteProvider(),
      child: Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Colors.black
              ),
            ),
            const SizedBox(height: 20,),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                      ),
                    ]
                  ),
                  child: Consumer<AddpostProvider>(
                    builder: (context,provider,_) {
                      return  ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return ListPostWidget(
                            title: provider.getTitleList()[index],
                            author: provider.getAuthorList()[index],
                            deadline: provider.getDeadlineList()[index],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider();
                        },
                      );
                    }
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
