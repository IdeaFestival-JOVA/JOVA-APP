import 'package:flutter/cupertino.dart';
import 'package:jovajovajova/myprofile_page/widget/major_select_button.dart';

class MajorSelectContainer extends StatelessWidget {
  const MajorSelectContainer({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          MajorSelectButton(major: "프론트엔드"),
          MajorSelectButton(major: "백엔드"),
        ],
      ),
    );
  }
}
