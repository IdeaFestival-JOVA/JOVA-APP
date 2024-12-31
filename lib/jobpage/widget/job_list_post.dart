import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jovajovajova/jobpage/screen/jobvacancy_screen.dart';

class JobListPost extends StatelessWidget {
  const JobListPost({
    super.key,
    required this.title,
    required this.author,
    required this.deadline, required this.content
  });

  final String title;
  final String author;
  final String deadline;
  final String content;



  @override
  Widget build(BuildContext context) {


    String originalDate = deadline;
    DateTime dateTime = DateTime.parse(originalDate);
    String formattedDateTime = DateFormat('yyyy-MM-dd').format(dateTime);

    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => JobvacancyScreen(title: title, author: author, content: content,))
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "작성일:${formattedDateTime}",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Text(
                "작성자:$author",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
