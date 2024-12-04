import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobWriteMain extends StatelessWidget {
  JobWriteMain({
    super.key,
    required this.controller,
    required this.maxline, required this.text,
  });

  TextEditingController controller = TextEditingController();
  final int maxline;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxline,
      decoration: InputDecoration(
        hintText: text,
        border: OutlineInputBorder(),
      ),
      controller: controller,
    );
  }
}
