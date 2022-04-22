import 'package:bloc_test/bloc_test.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/domain/helpers/params/result_login_social_param.dart';
import 'package:bstage2/ui/pages/login/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../domain/factory/params_factory.dart';
import '../../../domain/factory/user_entity_factory.dart';
import '../../mocks/mocks.dart';
import '../../mocks/user_local_usecase_spy.dart';

class CreateAccountParamsFake extends Fake implements CreateAccountParams {}

class UserEntityFake extends Fake implements UserEntity {}

void main() {
  late LoginPageBloc loginPageBloc;

  late UserLocalUsecaseSpy userLocalUsecaseSpy;
  late UserRemoteUsecaseSpy userRemoteUsecaseSpy;

  late ResultLoginSocial? resultLoginSocial;
  late UserEntity resultCreateUser;

  setUp(() {
    resultLoginSocial = ParamsFactory.makeResultLoginSocial();
    resultCreateUser = UserEntityFactory.makeNewUserEntity();

    userRemoteUsecaseSpy = UserRemoteUsecaseSpy();
    userLocalUsecaseSpy = UserLocalUsecaseSpy();

    userRemoteUsecaseSpy.mockCallLoginSocial(resultLoginSocial);
    userRemoteUsecaseSpy.mockCallCreate(resultCreateUser);
    userRemoteUsecaseSpy.mockCallVerifyIfUserExist(null);

    userLocalUsecaseSpy.mockCallInsertUser();

    loginPageBloc = LoginPageBloc(
      userLocalUsecase: userLocalUsecaseSpy,
      userRemoteUsecase: userRemoteUsecaseSpy,
    );
  });

  setUpAll(() {
    registerFallbackValue(CreateAccountParamsFake());
    registerFallbackValue(UserEntityFake());
  });

  blocTest(
    'Should emits [loading, loginSuccess] when facebook return true, new user and create api returns 200',
    build: () => loginPageBloc,
    act: (_) => loginPageBloc.add(LoginWithFacebookEvent()),
    expect: () => [isA<LoginPageLoading>(), isA<LoginWithFacebookSuccess>()],
  );

  blocTest(
    'Should emits [loading, loginSuccess] when facebook return true and users already exist',
    build: () {
      userRemoteUsecaseSpy.mockCallVerifyIfUserExist(UserEntityFactory.makeNewUserEntity());

      return loginPageBloc;
    },
    act: (_) => loginPageBloc.add(LoginWithFacebookEvent()),
    expect: () => [isA<LoginPageLoading>(), isA<LoginWithFacebookSuccess>()],
  );

  blocTest(
    'Should emits [loading, loginWithFacebookError] when loginFacebook returns null',
    build: () {
      userRemoteUsecaseSpy.mockCallLoginSocial(null);

      return loginPageBloc;
    },
    act: (_) => loginPageBloc.add(LoginWithFacebookEvent()),
    expect: () => [isA<LoginPageLoading>(), isA<LoginWithFacebookError>()],
  );

  blocTest(
    'Should emits [loading, loginWithFacebookError] when createUser throws',
    build: () {
      userRemoteUsecaseSpy.mockCallCreateError(DomainError.unexpected);

      return loginPageBloc;
    },
    act: (_) => loginPageBloc.add(LoginWithFacebookEvent()),
    expect: () => [isA<LoginPageLoading>(), isA<LoginWithFacebookError>()],
  );
}
