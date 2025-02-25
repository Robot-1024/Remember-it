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
      ),
      body: Text("helloworld"),
    );
  }
}
