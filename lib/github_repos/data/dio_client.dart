import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.github.com/',
      receiveTimeout: 15000,
      headers: <String, dynamic>{'Accept': 'application/vnd.github.v3+json'},
    ),
  );

  Future<List<dynamic>> getRepositories({int since = 0}) async {
    try {
      final Response repositoriesRaw = await _dio.get<List<dynamic>>(
        'repositories',
        queryParameters: <String, dynamic>{'since': since},
      );
      return repositoriesRaw.data as List<dynamic>;
    } on DioError catch (e) {
      return <dynamic>[];
    }
  }

  Future<List<dynamic>> getIssues(String apiEndPoint) async {
    try {
      final Response issuesRaw = await _dio.get<List<dynamic>>(apiEndPoint);
      return issuesRaw.data as List<dynamic>;
    } on DioError catch (e) {
      return <dynamic>[];
    }
  }

  Future<List<dynamic>> getPullRequests(String apiEndPoint) async {
    try {
      final Response pullRequestsRaw =
          await _dio.get<List<dynamic>>(apiEndPoint);
      return pullRequestsRaw.data as List<dynamic>;
    } on DioError catch (e) {
      return <dynamic>[];
    }
  }

  Future<List<dynamic>> searchForRepositories(
    String query, {
    int page = 1,
  }) async {
    try {
      final searchingDataRaw = await _dio.get<dynamic>(
        'search/repositories',
        queryParameters: <String, dynamic>{'q': query, 'page': page},
      );
      return searchingDataRaw.data['items'] as List<dynamic>;
    } on DioError catch (e) {
      return <dynamic>[];
    }
  }
}
