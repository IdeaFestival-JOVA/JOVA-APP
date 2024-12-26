import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'major_select_container.dart';

class MajorConfirmButton extends StatelessWidget {
  const MajorConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "전공",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 20,),
        OutlinedButton(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          onPressed: (){
            showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  title: Text("전공 선택"),
                  content: Column(
                    children: [
                      MajorSelectContainer(title: "일반 전공")
                    ],
                  ),
                );
              },
            );
          },
          child: Text(
            "전공 선택",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
