import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/mainpage/widget/list_post_widget.dart';

class MainContainer extends StatelessWidget {
  final String title;

  MainContainer({
    super.key,
    required this.title,
  });

  List<String> author_list = [
    "김동현",
    "최준영",
    "이상혁",
    "이주언",
  ];

   List<String> title_list = [
     "Iot",
     "Design",
     "Back_End",
     "Flutter",
   ];

   List<String> deadline_list = [
     "2024.1.1",
     "2024.3.13",
     "2024.5.5",
     "2024.7.29",
     "2024.12.25"
   ];

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
              color: Colors.black
            ),
          ),
          const SizedBox(height: 20,),
          Expanded(
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
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ListPostWidget(
                      author: author_list[index],
                      title: title_list[index],
                      deadline: deadline_list[index],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                  itemCount: author_list.length,
                ),
            ),
          )
        ],
      ),
    );
  }
}
