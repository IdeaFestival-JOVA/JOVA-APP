import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MajorSelectButton extends StatelessWidget {
  const MajorSelectButton({super.key, required this.major});

  final String major;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.grey,
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )
            ),
          ),
          onPressed: (){},
          child: Text(
            major,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
      ),
    );
  }
}
