import 'package:bstage2/data/data.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../domain/user_entity_factory.dart';
import '../../mocks/http_client_spy.dart';

void main() {
  late VerifyAccountExistUsecase sut;
  late String url;
  late HttpClientSpy httpClientSpy;
  late List<Map> apiResult;

  setUp(() {
    apiResult = [
      UserEntityFactory.makeNewUser(),
    ];
    url = faker.internet.httpUrl();
    httpClientSpy = HttpClientSpy();
    sut = VerifyAccountExistUsecase(httpClient: httpClientSpy, url: url);
    httpClientSpy.mockRequestGetWithParameters(apiResult);
  });

  test('Should return UserEntity when api returns 200', () async {
    final response = await sut.call(faker.guid.guid());

    expect(response, isA<UserEntity>());
  });

  test('Should return null when api returns empty', () async {
    httpClientSpy.mockRequestGetWithParameters([]);

    final response = await sut.call(faker.guid.guid());

    expect(response, null);
  });

  test('Should return Unexpected error when throws', () async {
    httpClientSpy.mockRequestGetWithParametersError(HttpError.serverError);

    final response = sut.call(faker.guid.guid());

    expect(response, throwsA(DomainError.unexpected));
  });
}
