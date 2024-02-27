import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? passwd;
    String? copyPasswd;
    String? id;
    String? name;
    String? email;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '회원가입',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: '아이디'),
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "아이디를 입력하세요";
                        }

                        if((value?.length ?? 0) < 5){
                          return "5글자 이상의 길이가 필요합니다";
                        }

                        if(true){
                          // 서버로부터 중복되는 아이디 있는 확인
                          // 비동기 함수?로 구현
                        }
                        return null;
                      },
                      onSaved: (value) {
                        id = value;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: '비밀번호'),
                      validator: (value){
                        if (value?.isEmpty ?? false) {
                          return "비밀번호를 입력하세요";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: '비밀번호 재입력'),
                      onSaved: (value){
                        passwd = value;
                      },
                      validator: (value){
                        if (value?.isEmpty ?? false) {
                          return "비밀번호를 입력하세요";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: '이름'),
                      onSaved: (value){
                        name = value;
                      },
                      validator: (value){
                        if (value?.isEmpty ?? false) {
                          return "이름을 입력하세요";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: '이메일'),
                      onSaved: (value){
                        email = value;
                      },
                      validator: (value){
                        if (value?.isEmpty ?? false) {
                          return "이메일을 입력하세요";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  if(_formKey.currentState?.validate() ?? false){
                    _formKey.currentState?.save();
                    print('id : $id, passwd : $passwd, name : $name, email : $email');
                  }
                },
                child: Text(
                  '회원가입',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
