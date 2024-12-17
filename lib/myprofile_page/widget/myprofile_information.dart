import 'package:flutter/material.dart';
import 'package:jovajovajova/myprofile_page/screen/profile_information_modify.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '기본 정보\n',
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
                width: 2,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Image.asset(
                          "asset/image/profile.png",
                          width: 130,
                          height: 130,
                        ),
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                width: double.infinity,
                                height: 30,
                                child: ListView.separated(
                                  itemCount: provider.majorList.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context,int index){
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: MajorListitem(major: provider.majorList[index]),
                                    );
                                  },
                                  separatorBuilder: (BuildContext context, int index) =>
                                      Divider(
                                        endIndent: 1,
                                      ),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                        onPressed: (){
                          Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => ProfileInformationModify()),
                          );
                        },
                      shape: CircleBorder(),
                      backgroundColor: Colors.grey[400],
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                ],
            ),
          )
        ],
      ),
    );
  }
}

