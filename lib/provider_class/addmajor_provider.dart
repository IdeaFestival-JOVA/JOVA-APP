import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Major extends ChangeNotifier{

  List<String> majorList =[
    '프론트엔드',
  ];

  void add_major({String? major}) {
    if (major != null) {
      majorList.add(major);
      majorList = majorList.toSet().toList();
      notifyListeners();
    }
  }
}