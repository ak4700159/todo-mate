import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'todo.dart';

class Todos with ChangeNotifier{
  List<Todo> todos = [];

  void getTodos() async {
    try {
      String uri = "http://Todo-env.eba-sjxw3eva.ap-northeast-2.elasticbeanstalk.com/user/api/1/profile";
      final parseUri = Uri.parse(uri);
      http.Response response = await http.get(parseUri);
      if (!(response.statusCode == 200) && !(response.statusCode == 204)) {
        throw Error();
      }
      // 리스트 맞게 형식 변환할 필요
      // name, description, profilePictures
      final list = utf8.decode(response.bodyBytes);
      print(list);
      notifyListeners();
    } catch (e) {
      print("에러 발생  : $e");
    }
  }
}