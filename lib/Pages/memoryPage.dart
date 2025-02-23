import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:remember_it/Pages/firstPage.dart';
import 'package:remember_it/data/word.dart';

Future<List<Word>> loadWords() async {
  final String response = await rootBundle.loadString('assets/words.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => Word.fromJson(json)).toList();
}

class MemoryPage extends StatefulWidget {
  const MemoryPage({super.key});

  @override
  _MemoryPageState createState() => _MemoryPageState();
}

class _MemoryPageState extends State<MemoryPage> {
  int wordNum = 0; // 当前显示的单词索引

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("记忆"),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<Word>>(
        future: loadWords(), // 加载 JSON 数据
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('加载失败'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('没有数据'));
          }

          final words = snapshot.data!;

          // 确保 wordNum 不超过数据的长度
          final word = words.length > wordNum ? words[wordNum] : words.last;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  '第 '+(wordNum+1).toString()+' 个 / 共 '+words.length.toString()+' 个',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 10),

                // 原词，48pt 加粗，deeppurple
                Text(
                  word.word,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple, // deeppurple
                  ),
                ),
                SizedBox(height: 20),
                // 显示释义
                Text(
                  "释义：",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black, // 黑色
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 10),
                // 遍历释义
                ...word.definitions.map((definition) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "${word.definitions.indexOf(definition) + 1}. $definition",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black, // 黑色
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    )),
                SizedBox(height: 20),
                // 例句
                Text(
                  //"例句: \n${word.exampleSentence}",
                  "例句功能开发中...",
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 58, 58, 58), // 黑色
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 20),
                // "下一个" 或 "结束" 按钮
                ElevatedButton(
                  onPressed: () {
                    if (wordNum < words.length - 1) {
                      setState(() {
                        // 显示下一个单词，循环显示
                        wordNum = wordNum + 1;
                      });
                    } else {
                      // 如果是最后一个单词，跳转到 homePage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FirstPage()),
                      ); // 使用路由跳转
                    }
                  },
                  child: Text(wordNum < words.length - 1 ? "下一个" : "结束"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    backgroundColor: Colors.deepPurple, // 按钮颜色
                    foregroundColor: Colors.white, // 按钮文字颜色
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
