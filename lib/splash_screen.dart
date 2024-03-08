import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todomate/entry_point.dart';
import 'package:todomate/function/login_function.dart';
import 'package:todomate/screen/login_screen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkLogin(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            if(snapshot.data == true){
              return EntryPoint();
            }
            else{
              return LoginScreen();
            }
          }
          return const CircularProgressIndicator();
        });
  }
}
