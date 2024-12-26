import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/myprofile_page/widget/information_input.dart';
import 'package:jovajovajova/myprofile_page/widget/information_modify_button.dart';
import 'package:jovajovajova/myprofile_page/widget/major_confirm_button.dart';

class ProfileInformationModify extends StatelessWidget {
  const ProfileInformationModify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 0.5,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "회원정보 수정",
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(
              'asset/image/profile.png',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            InformationInput(name: "이름", essential: true),
            InformationInput(name: "깃허브", essential: false),
            InformationInput(name: "E-mail", essential: true),
            SizedBox(height: 20),
            MajorConfirmButton(),
            Spacer(), // 빈 공간 추가
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InformationModifyButton(
                      text: "저장",
                      color: true,
                      onpressed: (){},
                  ),
                  SizedBox(width: 10), // 버튼 사이 여백 추가
                  InformationModifyButton(
                      text: "취소",
                      color: false,
                      onpressed: (){
                        Navigator.pop(context);
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
