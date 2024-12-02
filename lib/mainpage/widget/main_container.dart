import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/mainpage/widget/list_post_widget.dart';

class MainContainer extends StatelessWidget {
  final String title;

  MainContainer({
    super.key,
    required this.title,
  });

  List<String> list = [
    "앙",

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
            padding: EdgeInsets.all(8),
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
              child: ListView(
                children: [
                  ListPostWidget(
                      author: "이주언",
                      title: "디자인 모집",
                      deadline: "2024.12.25",
                  ),
                ],
              ),
          ),
        )
      ],
    );
  }
}
