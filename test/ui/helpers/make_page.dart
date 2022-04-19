import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../mocks/mock_go_router.dart';

Widget makePage({
  required List<BlocProvider> blocs,
  required Widget home,
  required MockGoRouter goRouter,
}) {
  return MultiBlocProvider(
    providers: [
      ...blocs,
    ],
    child: MaterialApp(
      home: MockGoRouterProvider(
        goRouter: goRouter,
        child: home,
      ),
    ),
  );
}
