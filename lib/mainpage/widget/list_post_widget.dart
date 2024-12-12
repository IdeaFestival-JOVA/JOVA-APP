import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/post_screen.dart';

class ListPostWidget extends StatelessWidget {
  const ListPostWidget({
    super.key,
    required this.author,
    required this.title,
    required this.deadline
  });


  final String author;
  final String title;
  final String deadline;

  Widget textstyle(String text){
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PostScreen())
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textstyle(author),
            textstyle(title),
            Text(
                deadline,
              style: TextStyle(
                color: Colors.black
              ),
            ),
          ],
        ),
      ),
    );
  }
}
