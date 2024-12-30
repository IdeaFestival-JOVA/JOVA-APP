import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider_class/addmajor_provider.dart';
import 'major_listitem.dart';

class MajorList extends StatelessWidget {
  const MajorList({super.key});

  @override
  Widget build(BuildContext context) {

    final add_major = Provider.of<Major>(context,listen: true);

    return Consumer<Major>(
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
    );
  }
}
