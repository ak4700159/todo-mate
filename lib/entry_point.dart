import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomate/screen/my_page_screen/my_page_screen.dart';
import 'package:todomate/screen/peed_screen(main)/peed_screen.dart';

import 'function/login_function.dart';
import 'model/todos.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  int _selectedBottomNavigation = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Todos()),
        FutureProvider<bool>(create: (_) => checkLogin(), initialData: false,),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.hourglass_empty,
            size: 30,
          ),
          actions: [
            IconButton(
              onPressed: () {
                setLoginFalse();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login_screen', (route) => false);
              },
              icon: const Icon(
                Icons.exit_to_app,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  print('set state');
                });
              },
              icon: const Icon(
                Icons.cached,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                size: 30,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              backgroundColor: Colors.white,
              label: "피드",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.man,
              ),
              backgroundColor: Colors.white,
              label: "My",
            ),
          ],
          currentIndex: _selectedBottomNavigation,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _selectedBottomNavigation = index;
            });
          },
        ),
        body: _selectedBottomNavigation == 0 ? PeedScreen() : MyPageScreen(),
      ),
    );
  }
}
