// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_test/flutter_test.dart';
import 'package:github_repos/github_repos/github_repos.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      expect(find.byType(GitHubRepos), findsOneWidget);
    });
  });
}
