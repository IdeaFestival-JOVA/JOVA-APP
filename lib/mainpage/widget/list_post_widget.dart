import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/jobpage/screen/jobvacancy_screen.dart';


class ListPostWidget extends StatelessWidget {
  const ListPostWidget({
    super.key,
    required this.author,
    required this.title,
    required this.deadline,
    required this.content,
    required this.post
  });


  final String author;
  final String title;
  final String deadline;
  final String content;
  final bool post;

  Widget textstyle(String text){

    String displayText =
    text.length > 5 ? '${text.substring(0, 5)}...' : text;

    return Text(
      displayText,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: (){
          post ? Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                JobvacancyScreen(
                  title: title,
                  author: author,
                  content: content,
                ),
            ),
          )
              :
              print("");
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
      );
  }
}
