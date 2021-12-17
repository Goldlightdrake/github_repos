import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_repos/github_repos/data/models/issue/issue.dart';
import 'package:github_repos/github_repos/data/models/pull_request/pull_request.dart';

part 'repository.freezed.dart';
part 'repository.g.dart';

@freezed
class Repository with _$Repository {
  @JsonSerializable(explicitToJson: true)
  const factory Repository({
    required String id,
    required String name,
    required String url,
    required List<Issue> issues,
    required List<PullRequest> pull_requests,
  }) = _Repository;

  factory Repository.fromJson(Map<String, dynamic> json) =>
      _$RepositoryFromJson(json);
}
