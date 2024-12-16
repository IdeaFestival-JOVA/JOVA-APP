import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Major extends ChangeNotifier{

  List<String> majorList =[
    '프론트엔드',
    '백엔드',
    '플러터',
  ];

  void addmajor({String? major}){
    if(major != null){
      majorList.add(major);
    }
  }
}