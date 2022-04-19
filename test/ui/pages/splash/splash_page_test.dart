import 'package:bloc_test/bloc_test.dart';
import 'package:bstage2/main/routers.dart';
import 'package:bstage2/ui/pages/splash/bloc/splash_page_bloc.dart';
import 'package:bstage2/ui/pages/splash/bloc/splash_page_event.dart';
import 'package:bstage2/ui/pages/splash/bloc/splash_page_state.dart';
import 'package:bstage2/ui/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/make_page.dart';
import '../../mocks/mock_go_router.dart';

class SplashPageBlocSpy extends MockBloc<ISplashPageEvent, ISplashPageState> implements SplashPageBloc {}

void main() {
  late SplashPageBlocSpy bloc;
  late MockGoRouter mockGoRouter;
  late String route;
  late ISplashPageState splashState;

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    bloc = SplashPageBlocSpy();
    mockGoRouter = MockGoRouter();
  });

  <String, ISplashPageState>{
    Routes.home: SplashPageUserLoggedState(),
    Routes.login: SplashPageUnexpectedErrorState(),
    Routes.login: SplashPageUserNotFoundState(),
  }.forEach((route, splashState) {
    testWidgets(
      'verify if call $route when state is $splashState',
      (tester) async {
        when(() => bloc.state).thenReturn(splashState);

        await tester.pumpWidget(
          makePage(
            blocs: [BlocProvider(create: (context) => bloc)],
            home: SplashPage(bloc: bloc),
            goRouter: mockGoRouter,
          ),
        );

        verify(() => mockGoRouter.go(route)).called(1);
      },
    );
  });
}
