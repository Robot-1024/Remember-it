import 'package:flutter/material.dart';
import 'package:remember_it/Pages/loginPage.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("个人信息",style: TextStyle(fontWeight: FontWeight.w600),),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 238, 229, 255),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "User",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "This is a smart, handsome man. Whose Name is Tang Kai Wen",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 238, 229, 255),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "版本",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                Text( // 版本号
                  "0.1.0"
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(0),
            width: double.infinity, // 保证按钮宽度和父容器一样宽
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
          
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // 按钮背景色为白色
                padding: const EdgeInsets.symmetric(vertical: 14), // 只设置上下内边距
                side: const BorderSide(color: Colors.red), // 按钮边框为红色
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // 圆角边框
                ),
              ),

              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.exit_to_app,color: Colors.red,),
                  SizedBox(width: 10),
                  Text(
                    "退出登录",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // 红色字体
                    ),
                  ),
                ],
                
              ),
            ),
          )
        ],
      ),
    );
  }
}
