import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobWriteMain extends StatelessWidget {
  const JobWriteMain({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 15,
      decoration: InputDecoration(
        hintText: "내용",
        border: OutlineInputBorder(),
      ),
    );
  }
}
