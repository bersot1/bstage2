import 'package:bstage2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../mocks/mock_go_router.dart';

Widget makePage({
  required List<BlocProvider> blocs,
  required Widget home,
  required MockGoRouter goRouter,
  Size size = const Size(750, 1334), // iphone 8 default
}) {
  // Widget makeTestableWidget({Widget child, Size size}) {
  //   return MaterialApp(
  //     home: MediaQuery(
  //       data: MediaQueryData(size: size),
  //       child: child,
  //     ),
  //   );
  // }
  return MultiBlocProvider(
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
  );
}
