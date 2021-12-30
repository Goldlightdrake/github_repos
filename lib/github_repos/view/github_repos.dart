import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos/github_repos/data/data_repository.dart';
import 'package:github_repos/github_repos/data/dio_client.dart';
import 'package:github_repos/github_repos/logic/repository_bloc/repositories_bloc.dart';
import 'package:github_repos/github_repos/view/main_screen/main_screen.dart';

class GitHubRepos extends StatelessWidget {
  const GitHubRepos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RepositoriesBloc(
        dataRepository: DataRepository(
          DioClient(),
        ),
      ),
      child: const Scaffold(
        body: SafeArea(child: MainScreen()),
      ),
    );
  }
}
