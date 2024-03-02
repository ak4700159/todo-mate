import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String?> sendIdToServer(Map<String, String> id) async {
  String uri = "https://goole.com";

  try {
    final parseUri = Uri.parse(uri);
    http.Response response = await http.post(parseUri, body: jsonEncode(id));
    if (!(response.statusCode == 200) && !(response.statusCode == 204)) {
      throw Error();
    }
    return "null";
  } catch (e) {
    print("에러 발생  : $e");
    return "중복검사 실패";
  }
}
