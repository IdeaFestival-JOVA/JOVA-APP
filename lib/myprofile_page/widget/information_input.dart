import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformationInput extends StatelessWidget {
  const InformationInput({
    super.key,
    required this.name,
    required this.essential,
    required this.controller,
    this.onchange,
    this.keyboardtype = TextInputType.text,
  });

  final String name;
  final bool essential;
  final TextEditingController controller;
  final Function(String)? onchange;
  final TextInputType keyboardtype;

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
                ),
              ),
              TextSpan(
                text: essential ? " *" : "",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        TextField(
          cursorColor: Colors.black,
          showCursor: true,
          onChanged: onchange,
          controller: controller,
          keyboardType: keyboardtype,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: "${name}을 입력해주세요",
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}