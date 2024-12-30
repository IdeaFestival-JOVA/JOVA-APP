import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../model/notification_api.dart';

class NotificationProvider extends ChangeNotifier{
  String title = '';
  String mainContent = '';
  String token = "";

  void updateTitle(String newTitle) {
    title = newTitle;
    notifyListeners();
  }

  void updateMainContent(String newContent) {
    mainContent = newContent;
    notifyListeners();
  }

  bool isFormValid() {
    return title.isNotEmpty && mainContent.isNotEmpty;
  }

  final geturl = Uri.parse("https://port-0-jova-backend-m0kvtwm45b2f2eb2.sel4.cloudtype.app/announcements/list");
  final posturl = Uri.parse("https://port-0-jova-backend-m0kvtwm45b2f2eb2.sel4.cloudtype.app/announcements");

  Future<List<Notification_model>> fetchNotifications() async {
    try {
      final response = await http.get(geturl);
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


  Future<void> fetchTokenWithPost() async {
    final url = Uri.parse(
        'https://port-0-jova-backend-m0kvtwm45b2f2eb2.sel4.cloudtype.app/auth/key?keyInput=aGJojaL6CSEzapYxaK24DLAmBp1mUaQ8VvHxyOufDU=');

    try {
      final response = await http.post(url);
      if (response.statusCode == 200) {
        token = response.body;
      } else {
        print('Failed to fetch token. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error fetching token: $e');
    }
  }

  Future<void> sendpostdata
      ({
    required String title,
    required String content,
  }) async{
    final headers = {
      'Authorization' : 'Bearer ${token}',
      'Content-Type' : 'application/json',
    };

    final body = {
      'title' : title,
      'content' : content,
    };

    try{
      final response = await http.post(
        posturl,
        headers: headers,
        body: jsonEncode(body),
      );

      if(response == 200){
        print("데이터 전송 성공");
        notifyListeners();
      }
      else{
        print(response.statusCode);
      }
    }
    catch(e){
      print(e);
    }
  }


}