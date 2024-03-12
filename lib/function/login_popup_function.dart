import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todomate/function/login_function.dart';
import 'package:todomate/screen/login_screen/register_screen.dart';


showLoginPopup(BuildContext context) {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? passwd;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        actionsPadding: const EdgeInsets.all(8),
        shape: Border.all(width: 1),
        title: const Text('로그인'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: '이메일'),
                validator: (value){
                  if(value?.isEmpty ?? false){
                    return '이메일을 입력하시오';
                  }
                  return null;
                },
                onSaved: (value){
                  email = value;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: '비밀번호'),
                validator: (value){
                  if(value?.isEmpty ?? false){
                    return '비밀번호를 입력하시오';
                  }
                  return null;
                },
                onSaved: (value){
                  passwd = value;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              '뒤로가기',
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
              );
            },
            child: const Text(
              '가입하기',
            ),
          ),
          TextButton(
            onPressed: () {
              if(_formKey.currentState?.validate() ?? false){
                _formKey.currentState?.save();
                print('id : $email, passwd : $passwd');
                // 자채적인 모의 시나리오를 위해서 무조건 로그인 성공을 가정
                setLoginTrue();
                Navigator.pushNamedAndRemoveUntil(context, '/entry_point', (route) => false);
              }
            },
            child: const Text(
              '로그인하기',
            ),
          ),
        ],
      );
    },
  );
}
