import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/mainpage/widget/main_appbar.dart';
import 'package:provider/provider.dart';
import '../../provider_class/myprofile_provider.dart';
import '../widget/myprofile_information.dart';

class MyprofileScreen extends StatefulWidget {
  const MyprofileScreen({super.key});

  @override
  State<MyprofileScreen> createState() => _MyprofileScreenState();
}

class _MyprofileScreenState extends State<MyprofileScreen> {
  @override
  Widget build(BuildContext context) {
    final myprofileProvider = Provider.of<MyProfile>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "마이 페이지",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 20),
            MyprofileInformation(
              name: myprofileProvider.name,
              github: myprofileProvider.github,
              email: myprofileProvider.email,
            ),
          ],
        ),
      ),
    );
  }
}

