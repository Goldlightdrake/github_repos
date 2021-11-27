import 'dart:convert';

class Issue {
  const Issue({
    required this.title,
  });

  factory Issue.fromMap(Map<String, dynamic> map) {
    return Issue(
      title: map['title'] as String,
    );
  }

  factory Issue.fromJson(String source) =>
      Issue.fromMap(json.decode(source) as Map<String, String>);

  final String title;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
    };
  }

  String toJson() => json.encode(toMap());
}
