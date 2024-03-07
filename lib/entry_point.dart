import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomate/screen/my_page_screen/my_page_screen.dart';
import 'package:todomate/screen/peed_screen(main)/peed_screen.dart';
import 'package:todomate/model/todos.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  int _selectedBottomNavigation = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.hourglass_empty,
          size: 30,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login_screen', (route) => false);
            },
            icon: const Icon(
              Icons.arrow_back,
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
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Todos()),
        ],
        child: _selectedBottomNavigation == 0 ? PeedScreen() : MyPageScreen(),
      ),
    );
  }
}
