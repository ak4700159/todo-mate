import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<bool> sendEmailToServer(String? email) async {
  String uri =
      "http://Todo-env.eba-sjxw3eva.ap-northeast-2.elasticbeanstalk.com/user/api/check-email";
  Map<String, String> emailMap = {
    "email": email ?? "빈이메일"
  };

  try {
    final parseUri = Uri.parse(uri);
    http.Response response = await http.post(
      parseUri,
      body: jsonEncode(
        emailMap,
      ),
      headers: {
        "content-type" : "application/json",
      }
    );
    print(response.statusCode);
    if (response.body == "ok" || response.statusCode == 200) {
      return true;
    }
    return false;
  } catch (e) {
    print("에러 발생  : $e");
    return false;
  }
}
