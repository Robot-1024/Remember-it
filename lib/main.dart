import 'package:flutter/material.dart';
import 'package:remember_it/Pages/firstPage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage() // 设置启动页面
    );
  }
}
