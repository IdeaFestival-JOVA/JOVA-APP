import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobWriteMain extends StatelessWidget {
  JobWriteMain({
    super.key,
    required this.controller,
    required this.maxline,
  });

  TextEditingController controller = TextEditingController();
  final int maxline;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxline,
      decoration: InputDecoration(
        hintText: "내용",
        border: OutlineInputBorder(),
      ),
      controller: controller,
    );
  }
}
