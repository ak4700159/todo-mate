import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showRegisterPopup(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('회원가입'),
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(decoration: InputDecoration(hintText: '아이디'),),
                TextField(decoration: InputDecoration(hintText: '비밀번호'),),
                TextField(decoration: InputDecoration(hintText: '비밀번호 재입력'),),
                TextField(decoration: InputDecoration(hintText: '이메일'),),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '뒤로가기',
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                '가입하기',
              ),
            ),
          ],
        );
      });
}
