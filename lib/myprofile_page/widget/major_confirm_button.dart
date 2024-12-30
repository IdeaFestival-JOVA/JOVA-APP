import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/provider_class/addmajor_provider.dart';
import 'package:provider/provider.dart';

class MajorConfirmButton extends StatelessWidget {
  const MajorConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {

    final addmajor = Provider.of<Major>(context);
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
            BottomPicker(
              pickerTitle: Text("전공 선택"),
              items: [
                Text("프론트 엔드"),
                Text("백엔드"),
                Text("디자인"),
                Text("DevOps"),
                Text("AI"),
                Text("Aos"),
                Text("Ios"),
                Text("DB"),
              ],
              onSubmit: (selectedItem) {
                addmajor.add_major(major: selectedItem);
              },
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
