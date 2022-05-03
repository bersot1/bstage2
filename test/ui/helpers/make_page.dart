import 'package:bstage2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../mocks/mock_go_router.dart';

Future<void> makePage({
  required WidgetTester tester,
  required List<Provider> blocs,
  required Widget home,
  required MockGoRouter goRouter,
  Size size = const Size(750, 1334), // iphone 8 default
}) async {
  // Widget makeTestableWidget({Widget child, Size size}) {
  //   return MaterialApp(
  //     home: MediaQuery(
  //       data: MediaQueryData(size: size),
  //       child: child,
  //     ),
  //   );
  // }
  return await tester.pumpWidget(
    MultiProvider(
      providers: [
        ...blocs,
      ],
      child: MaterialApp(
        theme: MakeThemeData.makeAppTheme(),
        home: MediaQuery(
          data: MediaQueryData(size: size),
          child: MockGoRouterProvider(
            goRouter: goRouter,
            child: home,
          ),
        ),
      ),
    ),
  );
}
