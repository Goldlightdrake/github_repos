// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:github_repos/app/router.dart';
import 'package:github_repos/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.router,
  }) : super(key: key);

  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: () => MaterialApp(
        onGenerateRoute: router.generateRoute,
        useInheritedMediaQuery: true, // Set to true
        locale: DevicePreview.locale(context),
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff1c2128),
          primaryColor: const Color(0xff1c2128),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          textTheme: const TextTheme(
            bodyText1:
                TextStyle(color: Color(0xffffffff), fontFamily: 'Montserrat'),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff316dca)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff414953)),
            ),
            hoverColor: Color(0xff2d333b),
            fillColor: Color(0xff22272e),
            filled: true,
          ),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xff2d333b),
          ),
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
