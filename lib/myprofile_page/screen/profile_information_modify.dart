import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/myprofile_page/widget/information_input.dart';
import 'package:jovajovajova/myprofile_page/widget/major_select_container.dart';

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
            width: 0.5
          )
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.xmark),
        ),
        title: Text(
          "회원정보 수정",
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                'asset/image/profile.png',
                width: 100,
              height: 100,
            ),
            SizedBox(height: 20,),
            InformationInput(name: "이름",essential: true,),
            InformationInput(name: "깃허브",essential: false,),
            InformationInput(name: "E-mail",essential: true,),
            SizedBox(height: 20,),
            Row(
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
            )
          ],
        ),
      ),
    );
  }
}
