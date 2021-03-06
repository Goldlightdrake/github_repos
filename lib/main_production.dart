// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:github_repos/app/app.dart';
import 'package:github_repos/app/router.dart';
import 'package:github_repos/bootstrap.dart';

void main() {
  bootstrap(() => App(router: AppRouter()));
}
