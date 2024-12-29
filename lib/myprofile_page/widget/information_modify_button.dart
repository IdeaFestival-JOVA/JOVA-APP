import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformationModifyButton extends StatelessWidget {
  const InformationModifyButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onpressed,
  }) : super(key: key);

  final String text;
  final bool color;
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey[300];
            }
            return color ? Colors.grey[500] : Colors.white;
          },
        ),
      ),
      onPressed: onpressed,
      child: Text(
        text,
        style: TextStyle(
          color: color ? Colors.white : Colors.grey[500],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
