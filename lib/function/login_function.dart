import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> setLogin({String? email, String? passwd}) async {
  String loginUri = "로그인 성공 확인 프로그램 주소";
  Map<String, String> loginMap = {"id": email ?? "", "passwd": passwd ?? ""};
  final response = await http.post(Uri.parse(loginUri),
      body: jsonEncode(loginMap),
      headers: {"content-type": "application/json"});
  if(response.body == "ok"){
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', true);

    //서버로부터 사용자 PK(user_id) 가져오고 내부 저장
    String idGetUri = "사용자 아이디 획득 프로그램 주소";
    Map<String, String> emailMap = {"email" : email ?? "error"};
    http.Response idResponse = await http.post(
        Uri.parse(idGetUri),
        body: jsonEncode(
          emailMap,
        ),
        headers: {
          "content-type" : "application/json",
        }
    );
    int userId = jsonDecode(idResponse.body) as int;
    prefs.setInt('user_id', userId);
    return true;
  }
  return false;
}

void setLoginFalse() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isLogin', false);
}

void setLoginTrue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isLogin', true);
}

Future<bool> checkLogin() async {
  Future.delayed(const Duration(seconds: 2)).then((_) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool('isLogin') ?? false;
    return isLogin;
  });
  return false;
}


