import 'dart:ffi';

import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/provider_class/addmajor_provider.dart';
import 'package:provider/provider.dart';

class MajorConfirmButton extends StatelessWidget {
  const MajorConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {

    final major = Provider.of<Major>(context,listen: true);
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
          onPressed: () {
            final List<Text> majors = [
              Text("프론트 엔드"),
              Text("백엔드"),
              Text("디자인"),
              Text("DevOps"),
              Text("AI"),
              Text("Aos"),
              Text("Ios"),
              Text("DB"),
            ];
            BottomPicker(
              pickerTitle: Text(
                  "전공 선택",
               style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              items: majors,
              onSubmit: (selectedItem) {
                print(selectedItem);
                String selectedMajor = (majors[selectedItem]).data ?? "선택 안됨";
                major.add_major(major: selectedMajor);
              },
              titleAlignment: Alignment.center,
              buttonContent: Text(
                  "확인",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              buttonStyle: BoxDecoration(
                color: Colors.black,
              ),
              dismissable: true,
            ).show(context);
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
