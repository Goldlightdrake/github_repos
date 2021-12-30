import 'package:github_repos/github_repos/data/dio_client.dart';
import 'package:github_repos/github_repos/data/models/models.dart';

class DataRepository {
  DataRepository(DioClient dioClient) : _dioClient = dioClient;

  final DioClient _dioClient;

  Future<List<Repository>> fetchRepositories({int since = 0}) async {
    final repositoriesRaw = await _dioClient.getRepositories(since: since);
    return repositoriesRaw
        .map(
          (dynamic e) => Repository.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }

  Future<List<Repository>> fetchSearchedRepositories(
    String query, {
    int page = 1,
  }) async {
    final repositoriesRaw = await _dioClient.searchForRepositories(
      query,
      page: page,
    );
    return repositoriesRaw
        .map(
          (dynamic e) => Repository.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }

  Future<List<Issue>> fetchIssues(String apiEndPoint) async {
    final issuesRaw = await _dioClient.getIssues(apiEndPoint);
    return issuesRaw
        .map(
          (dynamic e) => Issue.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }

  Future<List<PullRequest>> fetchPullRequests(String apiEndPoint) async {
    final pullRequestsRaw = await _dioClient.getIssues(apiEndPoint);
    return pullRequestsRaw
        .map(
          (dynamic e) => PullRequest.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }
}
