import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/mainpage/widget/list_post_widget.dart';

class MainContainer extends StatelessWidget {
  final String title;
  final String body;
  final String post_title;

  MainContainer({
    super.key,
    required this.title,
    required this.body,
    required this.post_title,
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
        Container(
            child: ListView(
              children: [
                ListPostWidget(
                    author: "이주언",
                    title: "디자인 모집",
                    deadline: "2024.12.25",
                ),
              ],
            ),
        )
      ],
    );
  }
}
