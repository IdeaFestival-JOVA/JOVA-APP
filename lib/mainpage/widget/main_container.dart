import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        )
      ],
    );
  }
}
