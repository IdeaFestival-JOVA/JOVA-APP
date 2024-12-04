import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobWriteTitle extends StatelessWidget {
  const JobWriteTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: "제목을 입력해주세요",
        border: OutlineInputBorder(),
      ),
    );
  }
}
