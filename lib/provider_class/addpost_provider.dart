import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jovajovajova/model/jobvacancy_list_model.dart';

class AddpostProvider extends ChangeNotifier {
  final List<int?> dayList = [];
  final List<String> titleList = [];
  final List<String> authorList = [];
  final List<String> deadlineList = [];

  Future<List<Jobvacancy>> fetchJobVacancies() async {
    final url = Uri.parse(
        "https://port-0-jova-backend-m0kvtwm45b2f2eb2.sel4.cloudtype.app/articles/list");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = utf8.decode(response.bodyBytes);
        final List<dynamic> parsedData = json.decode(jsonData);
        return parsedData.map((data) => Jobvacancy.fromJson(data)).toList();
      } else {
        print("Error: Failed to fetch data. Status code: ${response.statusCode}");
        throw Exception("Failed to fetch data");
      }
    } catch (e) {
      print("Exception occurred: $e");
      throw Exception("Error fetching job vacancies: $e");
    }
  }

  void addJob({
    int? day,
    String? title,
    String? author,
    String? deadline,
  }) {
    if (day != null) dayList.add(day);
    if (title != null) titleList.add(title);
    if (author != null) authorList.add(author);
    if (deadline != null) deadlineList.add(deadline);

    notifyListeners();
  }

  List<int?> getDayList() => List.unmodifiable(dayList);
  List<String> getTitleList() => List.unmodifiable(titleList);
  List<String> getAuthorList() => List.unmodifiable(authorList);
  List<String> getDeadlineList() => List.unmodifiable(deadlineList);
}
