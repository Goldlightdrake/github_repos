import 'package:flutter_test/flutter_test.dart';
import 'package:github_repos/github_repos/data/models/models.dart';

void main() {
  group('Issue', () {
    test('supports value comparison', () {
      expect(
        const Issue(title: 'issue title'),
        const Issue(title: 'issue title'),
      );
    });
  });
}
