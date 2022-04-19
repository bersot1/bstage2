import 'package:bstage2/data/data.dart';
import 'package:bstage2/data/http/http.dart';
import 'package:bstage2/data/usecases/user/create_account_usecase.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../domain/params_factory.dart';
import '../../../domain/user_entity_factory.dart';
import '../../mocks/http_client_spy.dart';

void main() {
  late CreateAccountUsecase sut;
  late HttpClientSpy httpClient;
  late String url;
  late CreateAccountParams newAccount;
  late Map apiResult;

  setUp(() {
    url = faker.internet.httpUrl();
    httpClient = HttpClientSpy();
    sut = CreateAccountUsecase(httpClient: httpClient, url: url);
    newAccount = ParamsFactory.makeCreateAccountParams();
    apiResult = UserEntityFactory.makeNewUser();
    httpClient.mockRequestPost(apiResult);
  });

  test('Should call httpClient with correct values', () async {
    await sut.call(account: newAccount);

    verify(() => httpClient.post(url: url, body: newAccount.toJson()));
  });

  test('Should return UserEntity when HTTP return 200', () async {
    final response = await sut.call(account: newAccount);

    expect(response, isA<UserEntity>());
    expect(response, UserModel.fromJson(apiResult).toEntity());
  });

  test('Should return emailInUse when badRequest', () async {
    httpClient.mockRequestPostError(HttpError.badRequest);
    final response = sut.call(account: newAccount);

    expect(response, throwsA(DomainError.emailInUse));
  });

  test('Should return ServerError when http throws', () async {
    httpClient.mockRequestPostError(HttpError.serverError);
    final response = sut.call(account: newAccount);

    expect(response, throwsA(DomainError.unexpected));
  });
}
