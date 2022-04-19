import 'package:bloc_test/bloc_test.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/ui/pages/splash/bloc/splash_page_bloc.dart';
import 'package:bstage2/ui/pages/splash/bloc/splash_page_event.dart';
import 'package:bstage2/ui/pages/splash/bloc/splash_page_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../domain/user_entity_factory.dart';
import '../../mocks/get_current_usecase_spy.dart';

void main() {
  late SplashPageBloc bloc;
  late GetCurrentUsecaseSpy getCurrentUsecase;
  late UserEntity? resultUsecase;

  setUp(() {
    resultUsecase = UserEntityFactory.makeNewUserEntity();
    getCurrentUsecase = GetCurrentUsecaseSpy();
    getCurrentUsecase.mockCall(resultUsecase);
    bloc = SplashPageBloc(getCurrentUsecase: getCurrentUsecase);
  });

  blocTest('Should emit [loading, loggedState ] when found user',
      build: () => bloc,
      act: (_) => bloc.add(SplashPageStartEvent()),
      expect: () => [isA<SplashPageLoadingState>(), isA<SplashPageUserLoggedState>()]);
  blocTest('Should emit [loading, userNotFoundState] when not found user',
      build: () {
        getCurrentUsecase.mockCall(null);
        return bloc;
      },
      act: (_) => bloc.add(SplashPageStartEvent()),
      expect: () => [isA<SplashPageLoadingState>(), isA<SplashPageUserNotFoundState>()]);

  blocTest('Should emit [loading, UnexpectedError] when something was wrong',
      build: () {
        getCurrentUsecase.mockCallError(DomainError.unexpected);
        return bloc;
      },
      act: (_) => bloc.add(SplashPageStartEvent()),
      expect: () => [isA<SplashPageLoadingState>(), isA<SplashPageUnexpectedErrorState>()]);
}
