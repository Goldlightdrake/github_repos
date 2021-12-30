import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:github_repos/github_repos/data/data_repository.dart';
import 'package:github_repos/github_repos/data/dio_client.dart';
import 'package:github_repos/github_repos/data/models/issue/issue.dart';
import 'package:github_repos/github_repos/data/models/pull_request/pull_request.dart';

// part 'repository.freezed.dart';
part 'repository.g.dart';

// @freezed
// class Repository with _$Repository {
//   @JsonSerializable(explicitToJson: true)
//   const factory Repository({
//     required int id,
//     @JsonKey(name: 'full_name') required String fullName,
//     required String url,
//     @JsonKey(name: 'issues_url') required String? issuesUrl,
//     @JsonKey(name: 'pulls_url') required String? pullsUrl,
//   }) = _Repository;

//   final _dataRepository = DataRepository(DioClient());

//   factory Repository.fromJson(Map<String, dynamic> json) =>
//       _$RepositoryFromJson(json);
// }

@JsonSerializable()
class Repository {
  @JsonSerializable(explicitToJson: true)
  Repository({
    required this.id,
    required this.fullName,
    required this.url,
    required this.issuesUrl,
    required this.pullsUrl,
  });

  factory Repository.fromJson(Map<String, dynamic> json) =>
      _$RepositoryFromJson(json);

  final int id;
  @JsonKey(name: 'full_name')
  final String fullName;
  final String url;
  @JsonKey(name: 'issues_url')
  final String? issuesUrl;
  @JsonKey(name: 'pulls_url')
  final String? pullsUrl;

  final DataRepository _dataRepository = DataRepository(DioClient());

  Future<List<Issue>> getIssues() async {
    if (issuesUrl == null) {
      return [];
    }
    var issueEndPoint = issuesUrl!.split('/').sublist(3, 7).join('/');
    final listOfIssues = await _dataRepository
        .fetchIssues(issueEndPoint.substring(0, issueEndPoint.length - 1));
    return listOfIssues;
  }

  Future<List<PullRequest>> getPullRequests() async {
    if (pullsUrl == null) {
      return [];
    }
    var pullsEndPoint = pullsUrl!.split('/').sublist(3, 7).join('/');
    final listOfPulls = await _dataRepository.fetchPullRequests(
        pullsEndPoint.substring(0, pullsEndPoint.length - 1));
    return listOfPulls;
  }

  @override
  String toString() {
    return 'Repository(id: $id, fullName: $fullName, url: $url, issuesUrl: $issuesUrl, pullsUrl: $pullsUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Repository &&
        other.id == id &&
        other.fullName == fullName &&
        other.url == url &&
        other.issuesUrl == issuesUrl &&
        other.pullsUrl == pullsUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullName.hashCode ^
        url.hashCode ^
        issuesUrl.hashCode ^
        pullsUrl.hashCode;
  }
}
