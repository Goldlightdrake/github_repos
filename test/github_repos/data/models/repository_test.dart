import 'package:flutter_test/flutter_test.dart';
import 'package:github_repos/github_repos/data/models/models.dart';

void main() {
  group('Repository', () {
    test('supports value comparison', () {
      expect(
        Repository(
          id: 1,
          fullName: 'fullName',
          url: 'repo/url',
          pullsUrl: 'pulls/url',
          issuesUrl: 'issue/url',
        ),
        Repository(
          id: 1,
          fullName: 'fullName',
          url: 'repo/url',
          pullsUrl: 'pulls/url',
          issuesUrl: 'issue/url',
        ),
      );
    });
  });
}
