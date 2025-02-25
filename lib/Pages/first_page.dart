import 'package:flutter/material.dart';
import 'package:remember_it/Pages/home_page.dart';import 'package:remember_it/Pages/poem_list_page.dart';
import 'package:remember_it/Pages/profile_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex = 0;

  void _navigateBottomBar (int index) {
    setState((){
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [

    const HomePage(),

    const PoemListPage(),

    const ProfilePage(),
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: _navigateBottomBar ,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '主页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: '诗单',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '个人信息',
          ),
        ],
      ),
    );
  }
}
