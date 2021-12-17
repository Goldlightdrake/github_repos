// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Repository _$$_RepositoryFromJson(Map<String, dynamic> json) =>
    _$_Repository(
      id: json['id'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
      issues: (json['issues'] as List<dynamic>)
          .map((e) => Issue.fromJson(e as Map<String, dynamic>))
          .toList(),
      pull_requests: (json['pull_requests'] as List<dynamic>)
          .map((e) => PullRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RepositoryToJson(_$_Repository instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'issues': instance.issues.map((e) => e.toJson()).toList(),
      'pull_requests': instance.pull_requests.map((e) => e.toJson()).toList(),
    };
