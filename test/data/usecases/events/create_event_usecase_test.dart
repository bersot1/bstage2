import 'dart:io';

import 'package:bstage2/data/http/http_error.dart';
import 'package:bstage2/data/usecases/events/create_event_usecase.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/domain/helpers/domain_error.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../domain/params_factory.dart';
import '../../mocks/http_client_spy.dart';

void main() {
  late CreateEventUsecase sut;
  late HttpClientSpy httpClient;
  late String url;
  late CreateEventParams newEvent;
  late File file;

  setUp(() {
    url = faker.internet.httpUrl();
    httpClient = HttpClientSpy();
    httpClient.mockRequestPostWithFile(true);
    newEvent = ParamsFactory.makeCreateEventParams();
    sut = CreateEventUsecase(client: httpClient, url: url);
  });

  setUpAll(() {
    file = File('lib/ui/assets/icon/favicon.png');

    registerFallbackValue(file);
  });

  test('Should call HttpClient with correct values', () async {
    await sut.call(newEvent);

    verify(() => httpClient.postWithFile(url: url, body: newEvent.toJson(), file: newEvent.image));
  });

  test('Should return true if HttpClients returns 201', () async {
    final response = await sut.call(newEvent);

    expect(response, true);
  });

  test('Should return DomainError.unexpected when HttpClient return error', () async {
    httpClient.mockRequestPostWithFileError(HttpError.badRequest);

    final response = sut(newEvent);

    expect(response, throwsA(DomainError.unexpected));
  });
}
