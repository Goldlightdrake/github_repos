import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_repos/github_repos/data/models/models.dart';

class RepositoryListTile extends StatelessWidget {
  const RepositoryListTile(Repository repository, {Key? key})
      : _repository = repository,
        super(key: key);

  final Repository _repository;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff414953),
        ),
      ),
      child: ListTile(
        style: ListTileStyle.drawer,
        title: Text(_repository.fullName),
        leading: SvgPicture.asset(
          'assets/repo_icon.svg',
          color: const Color(0xff768390),
          width: 40,
          height: 40,
        ),
        onTap: () => {
          Navigator.pushNamed(
            context,
            '/repository_detail',
            arguments: _repository,
          ),
        },
      ),
    );
  }
}
