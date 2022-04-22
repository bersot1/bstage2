import 'package:bloc_test/bloc_test.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/ui/pages/splash/bloc/splash_page_bloc.dart';
import 'package:bstage2/ui/pages/splash/bloc/splash_page_event.dart';
import 'package:bstage2/ui/pages/splash/bloc/splash_page_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../domain/factory/user_entity_factory.dart';
import '../../mocks/mocks.dart';

void main() {
  late SplashPageBloc bloc;
  late UserLocalUsecaseSpy userLocalUsecaseSpy;
  late UserEntity? resultUsecase;

  setUp(() {
    resultUsecase = UserEntityFactory.makeNewUserEntity();
    userLocalUsecaseSpy = UserLocalUsecaseSpy();
    userLocalUsecaseSpy.mockCallGetCurrentUser(resultUsecase);
    bloc = SplashPageBloc(userLocalUsecase: userLocalUsecaseSpy);
  });

  blocTest('Should emit [loading, loggedState ] when found user',
      build: () => bloc,
      act: (_) => bloc.add(SplashPageStartEvent()),
      expect: () => [isA<SplashPageLoadingState>(), isA<SplashPageUserLoggedState>()]);
  blocTest('Should emit [loading, userNotFoundState] when not found user',
      build: () {
        userLocalUsecaseSpy.mockCallGetCurrentUser(null);
        return bloc;
      },
      act: (_) => bloc.add(SplashPageStartEvent()),
      expect: () => [isA<SplashPageLoadingState>(), isA<SplashPageUserNotFoundState>()]);

  blocTest('Should emit [loading, UnexpectedError] when something was wrong',
      build: () {
        userLocalUsecaseSpy.mockCallGetCurrentUserError(DomainError.unexpected);
        return bloc;
      },
      act: (_) => bloc.add(SplashPageStartEvent()),
      expect: () => [isA<SplashPageLoadingState>(), isA<SplashPageUnexpectedErrorState>()]);
}
