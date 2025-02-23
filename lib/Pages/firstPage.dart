import 'package:flutter/material.dart';
import 'package:remember_it/Pages/homepage.dart';
import 'package:remember_it/Pages/profilePage.dart';
import 'package:remember_it/Pages/settingsPage.dart';

class FirstPage extends StatefulWidget {
  FirstPage({super.key});

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

  final List _pages = [

    HomePage(),

    ProfilePage(),

    SettingsPage(),

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
            icon: Icon(Icons.person),
            label: '个人信息',
          ),
          
        ],
      ),
    );
  }
}
