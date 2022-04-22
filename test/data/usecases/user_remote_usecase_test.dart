import 'package:bstage2/data/data.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/domain/helpers/params/create_user_params.dart';
import 'package:bstage2/domain/helpers/params/result_login_social_param.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/factory/params_factory.dart';
import '../../domain/factory/user_entity_factory.dart';
import '../spys/fb_package_client_spy.dart';
import '../spys/http_client_spy.dart';

void main() {
  late UserRemoteUsecase sut;
  late HttpClientSpy httpClient;
  late FbPackageSpy fbPackage;

  setUp(() {
    httpClient = HttpClientSpy();
    fbPackage = FbPackageSpy();
    sut = UserRemoteUsecase(httpClient: httpClient, fbPackage: fbPackage);
  });

  group('CreateAccountUsecase - ', () {
    late CreateAccountParams newAccount;
    late Map apiResult;

    setUp(() {
      newAccount = ParamsFactory.makeCreateAccountParams();
      apiResult = UserEntityFactory.makeNewUser();
      httpClient.mockRequestPost(apiResult);
    });

    test('Should call httpclient with correct values', () async {
      await sut.create(account: newAccount);

      verify(() => httpClient.post(url: 'perfil', body: newAccount.toJson()));
    });

    test('Should return UserEntity when HTTP return 200', () async {
      final response = await sut.create(account: newAccount);

      expect(response, isA<UserEntity>());
      expect(response, UserModel.fromJson(apiResult).toEntity());
    });

    test('Should return emailInUse when badRequest', () async {
      httpClient.mockRequestPostError(HttpError.badRequest);
      final response = sut.create(account: newAccount);

      expect(response, throwsA(DomainError.emailInUse));
    });

    test('Should return ServerError when http throws', () async {
      httpClient.mockRequestPostError(HttpError.serverError);
      final response = sut.create(account: newAccount);

      expect(response, throwsA(DomainError.unexpected));
    });
  });

  group('LoginWithFacebook - ', () {
    late Map<String, dynamic>? getUserDataResult;

    setUp(() {
      getUserDataResult = UserEntityFactory.makeNewUserDataFB();
      fbPackage.mockLogin(true);
      fbPackage.mockGetUserData(getUserDataResult);
    });
    test('Should return UserEntity when login returns true and getUserData return != null', () async {
      final response = await sut.loginSocial();

      expect(response, isA<ResultLoginSocial>());
    });
    test('Should return null when login returns true and getUserData return null', () async {
      fbPackage.mockGetUserData(null);
      final response = await sut.loginSocial();
      expect(response, null);
    });
    test('Should return null when login returns false', () async {
      fbPackage.mockLogin(false);
      final response = await sut.loginSocial();
      expect(response, null);
    });

    test('Should return DomainError unexpected when throws', () async {
      fbPackage.mockLoginError(HttpError.badRequest);
      final response = sut.loginSocial();
      expect(response, throwsA(DomainError.unexpected));
    });
  });

  group('VerifyAccountExist - ', () {
    late List<Map> apiResult;

    setUp(() {
      apiResult = [
        UserEntityFactory.makeNewUser(),
      ];
      httpClient.mockRequestGetWithParameters(apiResult);
    });

    test('Should call httpClient with correct values', () async {
      final idFacebook = faker.guid.guid();
      final queryParameter = {
        'filter': "IdFacebook:=:$idFacebook",
      };
      await sut.verifyIfUserExist(idFacebook);

      verify(() => httpClient.get('perfils/all', queryParameters: queryParameter));
    });

    test('Should return UserEntity when api returns 200', () async {
      final response = await sut.verifyIfUserExist(faker.guid.guid());

      expect(response, isA<UserEntity>());
    });

    test('Should return null when api returns empty', () async {
      httpClient.mockRequestGetWithParameters([]);

      final response = await sut.verifyIfUserExist(faker.guid.guid());

      expect(response, null);
    });

    test('Should return Unexpected error when throws', () async {
      httpClient.mockRequestGetWithParametersError(HttpError.serverError);

      final response = sut.verifyIfUserExist(faker.guid.guid());

      expect(response, throwsA(DomainError.unexpected));
    });
  });
}
