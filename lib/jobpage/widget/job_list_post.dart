import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/jobpage/screen/jobvacancy_screen.dart';

class JobListPost extends StatelessWidget {
  const JobListPost({
    super.key,
    required this.day,
    required this.title,
    required this.author,
    required this.deadline
  });

  final int day;
  final String title;
  final String author;
  final String deadline;



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => JobvacancyScreen(title: title, author: author))
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "D-$day",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                deadline,
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
