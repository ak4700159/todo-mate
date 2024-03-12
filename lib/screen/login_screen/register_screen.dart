import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:todomate/function/email_check_function.dart';

import '../../function/exit_popup_function.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _textIdController = TextEditingController();
  bool? emailCheckStatus;

  //컨트롤러에 등록된 텍스트 필드 내용 터미널에 출력
  void printController() {
    print('controller text : ${_textIdController.text}');
    print('controller selection : ${_textIdController.selection}');
  }

  // 컨트롤러에 등록된 텍스트 필드 내용 수동으로 변경
  void updateController() {
    _textIdController.value = TextEditingValue(
      text: "hello",
      selection: TextSelection.fromPosition(
          TextPosition(offset: _textIdController.text.length)),
    );
  }


  @override
  Widget build(BuildContext context) {
    String? passwd;
    String? copyPasswd;
    String? id = "";
    String? name;
    String? email;

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        showExitPopup(context);
      },
      child: Scaffold(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: TextFormField(
                              decoration: const InputDecoration(labelText: '이메일'),
                              validator: (value) {
                                if (value?.isEmpty ?? false) {
                                  return "이메일을 입력하세요";
                                }

                                if ((value?.length ?? 0) < 5) {
                                  return "5글자 이상의 길이가 필요합니다";
                                }

                                if (emailCheckStatus == null ||
                                    emailCheckStatus == false) {
                                  return "이메일 확인 실패";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                email = value;
                              },
                              onChanged: (value){
                                email = value;
                              },
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: OutlinedButton(
                              onPressed: () {
                                // 서버에 이메일을 보내고 중복되는 이메일이 있는지 확인
                                Future<bool> emailStatus = sendEmailToServer(email);
                                emailStatus.then((value) {
                                  emailCheckStatus = value;
                                  setState(() {});
                                });
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
                      emailCheckStatus == true || emailCheckStatus == null
                          ? const Text(
                              '양식에 맞는 이메일을 입력하시오',
                              style: TextStyle(color: Colors.grey, fontSize: 12),
                            )
                          : const Text(
                              '이메일 중복 (아이디 / 비밀찾기)',
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(labelText: '비밀번호'),
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return "비밀번호를 입력하세요";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(labelText: '비밀번호 재입력'),
                        onChanged: (value) {
                          copyPasswd = value;
                        },
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return "비밀번호를 다시 입력하세요";
                          }

                          if (value != passwd) {
                            return "비밀번호가 일차하지 않습니다.";
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
      ),
    );
  }
}
