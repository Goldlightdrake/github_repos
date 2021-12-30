// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repository _$RepositoryFromJson(Map<String, dynamic> json) => Repository(
      id: json['id'] as int,
      fullName: json['full_name'] as String,
      url: json['url'] as String,
      issuesUrl: json['issues_url'] as String?,
      pullsUrl: json['pulls_url'] as String?,
    );

Map<String, dynamic> _$RepositoryToJson(Repository instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'url': instance.url,
      'issues_url': instance.issuesUrl,
      'pulls_url': instance.pullsUrl,
    };
