import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WriteAppbar extends StatelessWidget implements PreferredSizeWidget{
  const WriteAppbar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 0.5,
          )
      ),
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(CupertinoIcons.xmark),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 24),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
