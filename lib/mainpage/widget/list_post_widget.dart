import 'package:flutter/cupertino.dart';

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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              author,
          ),
          Text(
            title,
          ),
          Text(
            deadline,
          ),
        ],
      ),
    );
  }
}
