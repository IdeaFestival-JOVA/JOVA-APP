import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/myprofile_page/widget/major_confirm_button.dart';
import 'package:provider/provider.dart';
import '../../provider_class/myprofile_provider.dart';
import '../widget/information_input.dart';
import '../widget/information_modify_button.dart';

class ProfileInformationModify extends StatelessWidget {
  const ProfileInformationModify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myprofileProvider = Provider.of<MyProfile>(context,listen: true);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: const Border(
          bottom: BorderSide(color: Colors.black, width: 0.5),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "회원정보 수정",
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/image/profile.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),
            InformationInput(
              keyboardtype: TextInputType.name,
              name: "이름",
              essential: true,
              controller: TextEditingController(text: myprofileProvider.tempName),
              onchange: (value) {
                myprofileProvider.tempName = value;
              },
            ),
            InformationInput(
              name: "깃허브",
              essential: false,
              controller: TextEditingController(text: myprofileProvider.tempGithub),
              onchange: (value) {
                myprofileProvider.tempGithub = value;
              },
            ),
            InformationInput(
              keyboardtype: TextInputType.emailAddress,
              name: "E-mail",
              essential: true,
              controller: TextEditingController(text: myprofileProvider.tempEmail),
              onchange: (value) {
                myprofileProvider.tempEmail = value;
              },
            ),
            MajorConfirmButton(),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InformationModifyButton(
                    text: "저장",
                    color: true,
                    onpressed: () {
                      myprofileProvider.check() ?
                      myprofileProvider.totalupdate(context)
                      : AlertDialog(
                        title: Text("이름 또는 이메일을 입력해주세요"),
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  InformationModifyButton(
                    text: "취소",
                    color: false,
                    onpressed: () {
                      myprofileProvider.backscreen(context);
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
