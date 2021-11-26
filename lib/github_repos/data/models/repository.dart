import 'dart:convert';

import 'issue.dart';

class Repository {
  const Repository({
    this.id = '',
    this.name = '',
    this.url = '',
    this.isEmpty = false,
    this.isLoading = false,
    this.issues,
  });

  final String id;
  final String name;
  final bool isLoading;
  final bool isEmpty;
  final String url;
  final List<Issue>? issues;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'isLoading': isLoading,
      'isEmpty': isEmpty,
      'url': url,
      'issues': issues!.map((x) => x.toMap()).toList(),
    };
  }

  factory Repository.fromMap(Map<String, dynamic> map) {
    return Repository(
      id: map['id'] as String,
      name: map['name'] as String,
      isLoading: map['isLoading'] as bool,
      isEmpty: map['isEmpty'] as bool,
      url: map['url'] as String,
      issues: List<Issue>.from(
        map['issues']?.map((Map<String, dynamic> x) => Issue.fromMap(x))
            as Iterable<dynamic>,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Repository.fromJson(String source) =>
      Repository.fromMap(json.decode(source) as Map<String, dynamic>);
}
