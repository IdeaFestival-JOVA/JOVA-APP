import 'package:flutter/material.dart';

class AddpostProvider extends ChangeNotifier {
  List<int?> dayList = [1, 2, 3, 4, 5];
  List<String> titleList = [
    "Iot",
    "Design",
    "Back_End",
    "Front_End",
    "Flutter",
  ];
  List<String> authorList = [
    "김동현",
    "최준영",
    "황지훈",
    "이상혁",
    "이주언",
  ];
  List<String> deadlineList = [
    "2024.1.1",
    "2024.3.13",
    "2024.5.5",
    "2024.4.4",
    "2024.7.29",
    "2024.12.25",
  ];

  void addJob({int? day, String? title, String? author, String? deadline}) {
    if (day != null) {
      dayList.add(day);
    }
    if (title != null) {
      titleList.add(title);
    }
    if (author != null) {
      authorList.add(author);
    }
    if (deadline != null) {
      deadlineList.add(deadline);
    }
    notifyListeners();
  }

  List<int?> getDayList() => dayList;
  List<String> getTitleList() => titleList;
  List<String> getAuthorList() => authorList;
  List<String> getDeadlineList() => deadlineList;
}
