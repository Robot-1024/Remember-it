import 'package:flutter/material.dart';
import 'package:remember_it/Pages/first_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstPage() // 设置启动页面
    );
  }
}
