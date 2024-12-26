import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobWriteMain extends StatelessWidget {
  const JobWriteMain({
    super.key,
    required this.controller,
    required this.maxline,
    required this.text,
    this.onChanged,
  });

  final TextEditingController controller;
  final int maxline;
  final String text;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxline,
      decoration: InputDecoration(
        hintText: text,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }
}
