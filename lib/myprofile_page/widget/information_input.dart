import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformationInput extends StatelessWidget {
  const InformationInput({super.key, required this.name, required this.essential});

  final String name;
  final bool essential;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: name,
                style: TextStyle(
                  color: Colors.black,
                )
              ),
              TextSpan(
                text: essential ? " *":"",
                style: TextStyle(
                  color: Colors.red,
                )
              )
            ]
          ),
        ),
        SizedBox(height: 8,),
        TextField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}
