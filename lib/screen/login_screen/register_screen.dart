import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../../function/id_check_function.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _textIdController = TextEditingController();

  void printController(){
    print('controller text : ${_textIdController.text}');
    print('controller selection : ${_textIdController.selection}');
  }

  void updateController(){
    _textIdController.value = TextEditingValue(
      text: "hello",
      selection: TextSelection.fromPosition(TextPosition(offset: _textIdController.text.length)),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? passwd;
    String? copyPasswd;
    String? id = "";
    String? name;
    String? email;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '회원가입',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            controller: _textIdController,
                            decoration:
                                const InputDecoration(labelText: '아이디'),
                            validator: (value) {
                              String? result;
                              if (value?.isEmpty ?? false) {
                                result = "아이디를 입력하세요";
                              }

                              if ((value?.length ?? 0) < 5) {
                                result = "5글자 이상의 길이가 필요합니다";
                              }

                              return result;
                            },
                            onSaved: (value) {
                              id = value;
                            },
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: OutlinedButton(
                            onPressed: () {
                              printController();
                              updateController();
                            },
                            child: const Text(
                              '중복확인',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: '비밀번호'),
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "비밀번호를 입력하세요";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: '비밀번호 재입력'),
                      onSaved: (value) {
                        passwd = value;
                      },
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "비밀번호를 입력하세요";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: '이름'),
                      onSaved: (value) {
                        name = value;
                      },
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "이름을 입력하세요";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: '이메일'),
                      onSaved: (value) {
                        email = value;
                      },
                      validator: (value) {
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
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    print(
                        'id : $id, passwd : $passwd, name : $name, email : $email');
                  }
                },
                child: const Text(
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
