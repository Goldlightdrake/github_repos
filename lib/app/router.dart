import 'package:flutter/material.dart';
import 'package:github_repos/github_repos/data/models/models.dart';
import 'package:github_repos/github_repos/github_repos.dart';
import 'package:github_repos/github_repos/view/repository_detail/repository_detail.dart';

class AppRouter {
  MaterialPageRoute? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute<dynamic>(builder: (_) => const GitHubRepos());
      case '/repository_detail':
        final repository = settings.arguments as Repository;
        return MaterialPageRoute<dynamic>(
          builder: (_) => RepositoryDetail(repository),
        );
      default:
        return null;
    }
  }
}
