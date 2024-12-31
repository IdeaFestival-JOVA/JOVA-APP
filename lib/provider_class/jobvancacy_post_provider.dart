import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jovajovajova/model/jobvacancy_list_model.dart';

class AddpostProvider extends ChangeNotifier {
  String token = "";
  final geturl = Uri.parse(
      "https://port-0-jova-backend-m0kvtwm45b2f2eb2.sel4.cloudtype.app/articles/list");
  final posturl = Uri.parse("https://port-0-jova-backend-m0kvtwm45b2f2eb2.sel4.cloudtype.app/articles");

  Future<void> fetchTokenWithPost() async {
    final url =
        "https://port-0-jova-backend-m0kvtwm45b2f2eb2.sel4.cloudtype.app/auth/key?keyInput=aGJojaL6CSEzapYxaK24DLAmBp1mUaQ8VvHxyOufDU=";

    try {
      final response = await http.post(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        print("Token fetched successfully: ${response.body}");
        token = response.body;
      } else {
        print("Failed to fetch token. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print("Error occurred while fetching token: $e");
    }
  }


  Future<List<Jobvacancy>> fetchJobVacancies() async {
    try {
      final response = await http.get(geturl);
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

  Future<void> sendpostdata
      ({
    required String title,
    required String content,
    required int category,
    required String author,
    }) async{
      final headers = {
        'Authorization' : 'Bearer ${token}',
        'Content-Type' : 'application/json',
      };

      final body = {
        'title' : title,
        'content' : content,
        'category' : category,
        'author' : author,
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
          print("Failed to fetch token. Status code: ${response.statusCode}");
          print("Response body: ${response.body}");
        }
      }
      catch(e){
        print(e);
      }
  }

}
