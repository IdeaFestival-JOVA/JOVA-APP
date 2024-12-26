import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformationModifyButton extends StatelessWidget {
  const InformationModifyButton({
    super.key,
    required this.text,
    required this.color,
    required this.onpressed});

  final String text;
  final bool color;
  final Function onpressed;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
        ),
        backgroundColor: MaterialStateProperty.all(
          color? Colors.grey[500]:Colors.white,
        ),

      ),
      onPressed: () => onpressed,
      child: Text(
        text,
        style: TextStyle(
            color: color? Colors.white:Colors.grey[500],
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
