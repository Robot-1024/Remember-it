

class Poem {
  final String title;
  final List<String> content;

  Poem({
    required this.title,
    required this.content,
  });

  // 从 JSON 数据创建 Word 对象
  factory Poem.fromJson(Map<String, dynamic> json) {
    return Poem(
      title: json['title'],
      content: List<String>.from(json['content']),
    );
  }
}
