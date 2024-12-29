import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobvacancyScreen extends StatelessWidget {
  const JobvacancyScreen({super.key, required this.title, required this.author});

  final String title;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(author),
          Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                  ),
                  backgroundColor: MaterialStateProperty.all(
                      Colors.grey[500],
                  ),
                ),
                onPressed: (){},
                child: Text(
                  "지원하기"
                ),
            ),
          )
        ],
      ),
    );
  }
}
