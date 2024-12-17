import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MajorListitem extends StatelessWidget {
  const MajorListitem({super.key, required this.major});

  final String major;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[300]
      ),
      width: 60,
      child: Center(
        child: Text(
          major,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
