import 'package:flutter/material.dart';

class IssuePullRequestListTile extends StatelessWidget {
  const IssuePullRequestListTile(
    String title, {
    Key? key,
  })  : _title = title,
        super(key: key);

  final String _title;

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
        title: Text(_title),
        onTap: () => null,
      ),
    );
  }
}
