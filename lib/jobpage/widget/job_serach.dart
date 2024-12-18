import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobSerach extends StatelessWidget {
  const JobSerach({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SearchBar(
            hintText: "입력",
          ),
          Icon(Icons.search
          ),
        ],
      ),
    );
  }
}
