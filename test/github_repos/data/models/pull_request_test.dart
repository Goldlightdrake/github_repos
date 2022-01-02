import 'package:flutter_test/flutter_test.dart';
import 'package:github_repos/github_repos/data/models/models.dart';

void main() {
  group('PullRequest', () {
    test('supports value comparison', () {
      expect(
        const PullRequest(title: 'issue title'),
        const PullRequest(title: 'issue title'),
      );
    });
  });
}
