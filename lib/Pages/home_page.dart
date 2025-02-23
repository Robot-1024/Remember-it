import 'package:flutter/material.dart';
import 'package:remember_it/Pages/memory_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("主页",style: TextStyle(fontWeight: FontWeight.w600),),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 238, 229, 255),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "中考150实词", // 书名
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 8), // 进度间距
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "4", // 已记忆的进度
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          TextSpan(
                            text: "/6", // 总进度
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 74, 74, 74),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 150,
                      child: LinearProgressIndicator(
                        value: 4 / 6, // 进度值
                        backgroundColor:
                            Color.fromARGB(255, 221, 195, 247),
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Color.fromARGB(255, 124, 15, 203)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16), // 按钮间距
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // 跳转到 MemoryPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MemoryPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                      backgroundColor: const Color.fromARGB(255, 124, 15, 203), // 按钮背景色
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.menu_book_rounded,color: Colors.white,),
                        SizedBox(width: 10),
                        Text(
                          "开始记忆",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
