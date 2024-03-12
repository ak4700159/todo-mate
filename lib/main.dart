import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todomate/screen/login_screen/login_screen.dart';
import 'package:todomate/screen/login_screen/register_screen.dart';
import 'package:todomate/screen/entry_point.dart';
import 'package:todomate/screen/login_screen/splash_screen.dart';


void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login_screen' : (context) => const LoginScreen(),
        '/entry_point' : (context) => const EntryPoint(),
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