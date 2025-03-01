import 'package:flutter/material.dart';
import 'package:remember_it/Pages/first_page.dart';
import 'package:remember_it/Pages/home_page.dart';
import 'package:remember_it/Pages/login_page.dart';
import 'package:remember_it/Pages/poem_list_page.dart';
import 'package:remember_it/Pages/profile_page.dart';
import 'package:remember_it/Pages/settings_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const FirstPage(), // 设置启动页面
      initialRoute: '/',
      routes: {
        '/first_page': (context) => const FirstPage(),
        '/profile_page': (context) => const ProfilePage(),
        '/settings_page': (context) => const SettingsPage(),
        '/home_page': (context) => const HomePage(),
        '/poem_list_page': (context) => const PoemListPage(), 
        '/login_page': (context) => const LoginPage(), 
      },
    );
  }
}
