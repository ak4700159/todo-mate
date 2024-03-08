import 'package:flutter/material.dart';
import 'package:todomate/screen/login_screen/login_screen.dart';
import 'package:todomate/screen/login_screen/register_screen.dart';
import 'package:todomate/entry_point.dart';
import 'package:todomate/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login_screen' : (context) => LoginScreen(),
        '/entry_point' : (context) => EntryPoint(),
        '/register_screen' : (context) => RegisterScreen(),
        '/splash_screen' : (context) => SplashScreen(),
      },
      initialRoute: '/splash_screen',
      debugShowCheckedModeBanner: false,
      title: 'TODO MATE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}