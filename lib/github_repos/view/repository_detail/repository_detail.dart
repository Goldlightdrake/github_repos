import 'package:flutter/material.dart';
import 'package:github_repos/github_repos/data/models/models.dart';
import 'package:github_repos/github_repos/view/repository_detail/widgets/widgets.dart';

class RepositoryDetail extends StatelessWidget {
  const RepositoryDetail(Repository repository, {Key? key})
      : _repository = repository,
        super(key: key);

  final Repository _repository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: const <dynamic>[],
      future: Future.wait([
        _repository.getIssues(),
        _repository.getPullRequests(),
      ]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        var issues = <Issue>[];
        var pullRequests = <PullRequest>[];
        if (snapshot.data!.isNotEmpty) {
          issues = snapshot.data![0] as List<Issue>;
          pullRequests = snapshot.data![1] as List<PullRequest>;
        }
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextButton(
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Issues',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: issues.length,
                          itemBuilder: (context, index) =>
                              IssuePullRequestListTile(issues[index].title),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'PullRequests',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: pullRequests.length,
                          itemBuilder: (context, index) =>
                              IssuePullRequestListTile(
                            pullRequests[index].title,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
