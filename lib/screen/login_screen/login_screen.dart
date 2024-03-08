import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todomate/function/exit_popup_function.dart';
import 'package:todomate/function/login_popup_function.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        showExitPopup(context);
      },
      child: Scaffold(
        // 키보드 overflowed를 방지하는 옵션이다.
        resizeToAvoidBottomInset: false,
        // 안드로이드 버젼 업그레이드로 인해 WillPopScope 사용하지 않고
        // 대신 PopScope를 사용하낟
        body: SafeArea(
          child: Stack(
            children: [
              Image.asset(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                'assets/login_background.png',
              ),
              Positioned(
                bottom: 30,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: Colors.white,
                              ),
                              color: const Color(0xAAD1DAFA),
                            ),
                            child: TextButton(
                              onPressed: () {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        surfaceTintColor: Colors.white,
                                        backgroundColor: Colors.white,
                                        shape: Border.all(width: 1),
                                        content: const Text('게스트로 로그인 하시겠습니까?'),
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
                                              Navigator.pushNamedAndRemoveUntil(
                                                  context,
                                                  '/entry_point',
                                                  (route) => false);
                                            },
                                            child: const Text(
                                              '게스트로 시작',
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: const Text(
                                '게스트로 시작',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: Colors.white,
                              ),
                              color: const Color(0xAAD1DAFA),
                            ),
                            child: TextButton(
                              onPressed: () {
                                showLoginPopup(context);
                              },
                              child: const Text(
                                '로그인',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register_screen');
                          },
                          child: const Text(
                            '가입하기',
                            style: TextStyle(
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
