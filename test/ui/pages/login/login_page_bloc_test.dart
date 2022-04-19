import 'package:bloc_test/bloc_test.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/domain/helpers/params/result_login_social_param.dart';
import 'package:bstage2/ui/pages/login/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../domain/params_factory.dart';
import '../../../domain/user_entity_factory.dart';
import '../../mocks/create_account_usecase_spy.dart';
import '../../mocks/insert_account_local_spy.dart';
import '../../mocks/login_facebook_usecase_spy.dart';
import '../../mocks/verify_account_exist_usecase_spy.dart';

class CreateAccountParamsFake extends Fake implements CreateAccountParams {}

class UserEntityFake extends Fake implements UserEntity {}

void main() {
  late LoginPageBloc loginPageBloc;

  late CreateAccountUsecaseSpy createAccountUsecaseSpy;
  late LoginFacebookUsecaseSpy loginFacebookUsecaseSpy;
  late InsertAccountLocalUsecaseSpy insertAccountLocalUsecaseSpy;
  late VerifyAccountExistUsecaseSpy verifyAccountExistUsecaseSpy;

  late ResultLoginSocial? resultLoginSocial;
  late UserEntity resultCreateUser;

  setUp(() {
    resultLoginSocial = ParamsFactory.makeResultLoginSocial();
    resultCreateUser = UserEntityFactory.makeNewUserEntity();

    loginFacebookUsecaseSpy = LoginFacebookUsecaseSpy();
    loginFacebookUsecaseSpy.mockCall(resultLoginSocial);

    createAccountUsecaseSpy = CreateAccountUsecaseSpy();
    createAccountUsecaseSpy.mockCall(resultCreateUser);

    insertAccountLocalUsecaseSpy = InsertAccountLocalUsecaseSpy();
    insertAccountLocalUsecaseSpy.mockCall();

    verifyAccountExistUsecaseSpy = VerifyAccountExistUsecaseSpy();
    verifyAccountExistUsecaseSpy.mockCall(null);

    loginPageBloc = LoginPageBloc(
        loginSocial: loginFacebookUsecaseSpy,
        createAccountUsecase: createAccountUsecaseSpy,
        insertAccountLocalUsecase: insertAccountLocalUsecaseSpy,
        verifyAccountExistUsecase: verifyAccountExistUsecaseSpy);
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
      verifyAccountExistUsecaseSpy.mockCall(UserEntityFactory.makeNewUserEntity());

      return loginPageBloc;
    },
    act: (_) => loginPageBloc.add(LoginWithFacebookEvent()),
    expect: () => [isA<LoginPageLoading>(), isA<LoginWithFacebookSuccess>()],
  );

  blocTest(
    'Should emits [loading, loginWithFacebookError] when loginFacebook returns null',
    build: () {
      loginFacebookUsecaseSpy.mockCall(null);

      return loginPageBloc;
    },
    act: (_) => loginPageBloc.add(LoginWithFacebookEvent()),
    expect: () => [isA<LoginPageLoading>(), isA<LoginWithFacebookError>()],
  );

  blocTest(
    'Should emits [loading, loginWithFacebookError] when createUser throws',
    build: () {
      createAccountUsecaseSpy.mockCallError(DomainError.unexpected);

      return loginPageBloc;
    },
    act: (_) => loginPageBloc.add(LoginWithFacebookEvent()),
    expect: () => [isA<LoginPageLoading>(), isA<LoginWithFacebookError>()],
  );
}
