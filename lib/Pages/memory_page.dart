import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:remember_it/Pages/first_page.dart';
import 'package:remember_it/data/poem.dart';

Future<List<Poem>> loadPoems() async {
  final String response = await rootBundle.loadString('assets/poems.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => Poem.fromJson(json)).toList();
}

class MemoryPage extends StatefulWidget {
  const MemoryPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MemoryPageState createState() => _MemoryPageState();
}

class _MemoryPageState extends State<MemoryPage> {
  int wordNum = 0; // 当前显示的单词索引
  List<int> stepNum = [1, 1, 1]; // 当前的步骤索引
  int stepMax = 5;

  /*

  步骤说明:
  step1: 总览诗歌
  step2.1.1: 单看一句诗
  step2.1.2: 单句挖空（3个字）
  step2.1.3: 上下句默写
  step2.2,2.3,2.4...: 重复以上步骤
  step3: 全诗出4道上下句默写
  step4: 全诗总览
  step5: 全诗默写
  end

  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("记忆"),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<Poem>>(
        future: loadPoems(), // 加载 JSON 数据
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('加载失败'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('没有数据'));
          }

          final poems = snapshot.data!;

          // 确保 wordNum 不超过数据的长度
          final poem = poems.length > wordNum ? poems[wordNum] : poems.last;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '第 ${stepNum[0]}.${stepNum[1]} 步 / 共 ${stepMax} 步',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 10),

                // 原词，48pt 加粗，deeppurple
                Text(
                  poem.title,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple, // deeppurple
                  ),
                ),
                const SizedBox(height: 20),
                // 显示释义

                // 遍历释义
                ...poem.content.map((content) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "$content",
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black, // 黑色
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    )),
                const SizedBox(height: 20),
                // 例句

                const SizedBox(height: 20),
                // "下一个" 或 "结束" 按钮
                ElevatedButton(
                  onPressed: () {
                    if (stepNum[0] < stepMax) {
                      setState(() {
                        // 显示下一步，循环显示
                        if (stepNum[0] == 2) {
                          // 单句精读
                          if (stepNum[1] == poem.content.length) {
                            stepNum[0]++;
                            stepNum[1] = 1;
                            stepNum[2] = 1;
                          } else {
                            if (stepNum[2] == 3) {
                              // 完成一句的学习
                              stepNum[1]++;
                              stepNum[2] = 1;
                            } else {
                              stepNum[2]++;
                            }
                          }
                        } else {
                          stepNum[0]++;
                        }
                      });
                    } else {
                      // 如果是最后一个单词，跳转到 homePage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FirstPage()),
                      ); // 使用路由跳转
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 32),
                    backgroundColor: Colors.deepPurple, // 按钮颜色
                    foregroundColor: Colors.white, // 按钮文字颜色
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text(stepNum[0] < stepMax ? "下一个" : "结束"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
