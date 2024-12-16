import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MajorListitem extends StatelessWidget {
  const MajorListitem({super.key, required this.major});

  final String major;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Text(
        major,
      ),
    );
  }
}
