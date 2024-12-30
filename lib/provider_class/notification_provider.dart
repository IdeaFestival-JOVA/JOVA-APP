import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/notification_api.dart';

class NotificationProvider extends ChangeNotifier{

  final url = Uri.parse("https://port-0-jova-backend-m0kvtwm45b2f2eb2.sel4.cloudtype.app/announcements/list");

  Future<List<Notification_model>> fetchNotifications() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = utf8.decode(response.bodyBytes);
        final List<dynamic> parsedData = json.decode(jsonData);
        return parsedData.map((data) => Notification_model.fromJson(data)).toList();
      } else {
        print("Error: Failed to fetch data. Status code: ${response.statusCode}");
        throw Exception("Failed to fetch data");
      }
    } catch (e) {
      print("Exception occurred: $e");
      throw Exception("Error fetching job vacancies: $e");
    }
  }

}