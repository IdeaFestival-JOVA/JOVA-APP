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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(author)
        ],
      ),
    );
  }
}
