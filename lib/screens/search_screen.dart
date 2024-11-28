import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/mainpage/screen/main_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context); // 이전 화면으로 돌아가기
                },
              ),
              Expanded(
                child: Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          focusNode: _focusNode,
                          decoration: InputDecoration(
                            hintText: "구인 구직 찾아보기",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(Icons.search, color: Colors.black),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Text("검색 결과를 여기에 표시합니다."),
        ),
      ),
    );
  }
}