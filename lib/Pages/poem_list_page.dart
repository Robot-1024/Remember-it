import 'package:flutter/material.dart';

class PoemListPage extends StatelessWidget {
  const PoemListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '诗单',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Text("请选择你的诗单"),
    );
  }
}
