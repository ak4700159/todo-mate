import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'todo.dart';

class Todos with ChangeNotifier{
  List<Todo> todos = [];


  void getData(String? email) async {
    int userId = 1;
    try {
      // 서버에 이메일을 보내면 그에 해당하는 유저 아이디를 받는다
      Map<String, String> emailMap = {"email" : email ?? "error"};
      String idGetUri = "";
      http.Response idResponse = await http.post(
          Uri.parse(idGetUri),
          body: jsonEncode(
            emailMap,
          ),
          headers: {
            "content-type" : "application/json",
          }
      );
      userId = jsonDecode(idResponse.body);

      // 받은 유저 아이디를 통해 해당 사용자의 대이터를 받는다.
      String uri = "http://Todo-env.eba-sjxw3eva.ap-northeast-2.elasticbeanstalk.com/user/api/$userId}/profile";
      http.Response response = await http.get(Uri.parse(uri));
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