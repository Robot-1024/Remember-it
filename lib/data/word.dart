// lib/models/word.dart

class Word {
  final String word;
  final List<String> definitions;
  final String exampleSentence;

  Word({
    required this.word,
    required this.definitions,
    required this.exampleSentence,
  });

  // 从 JSON 数据创建 Word 对象
  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      word: json['word'],
      definitions: List<String>.from(json['definitions']),
      exampleSentence: json['exampleSentence'],
    );
  }
}
