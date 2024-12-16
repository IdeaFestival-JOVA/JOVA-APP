import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/main.dart';
import 'package:jovajovajova/myprofile_page/widget/major_listitem.dart';
import 'package:jovajovajova/provider_class/addmajor_provider.dart';
import 'package:provider/provider.dart';

class MyprofileInformation extends StatelessWidget {
  const MyprofileInformation
      ({
    super.key,
    required this.name,
    required this.github,
    required this.email
      });

  final String name;
  final String github;
  final String email;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Major(),
      child: Column(
        children: [
          Text(
            '기본 정보',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            width: 410,
            height: 450,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(
                width: 3,
                color: Colors.grey,
              )
            ),
            child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Image.asset(
                          "asset/image/profile.png",
                          width: 150,
                          height: 150,
                        ),
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(
                          "깃허브\n${github}\n\nE-mail\n${email}\n\n전공",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Consumer<Major>(
                          builder: (context,provider,_){
                            return SizedBox(
                              height: 30,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: provider.majorList.length,
                                itemBuilder: (BuildContext context,int index){
                                  return MajorListitem(major: provider.majorList[index]);
                                },
                              ),
                            );
                          }
                        ),
                      ],
                    ),
                  ),
                ],
            ),
          )
        ],
      ),
    );
  }
}

