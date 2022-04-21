import 'dart:io';

import 'package:bstage2/data/data.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/domain/helpers/params/create_event_params.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/event_entity_factory.dart';
import '../../domain/params_factory.dart';
import '../mocks/http_client_spy.dart';

void main() {
  late EventUsecase sut;
  late HttpClientSpy httpClient;
  late List<Map> apiResult;

  setUp(() {
    httpClient = HttpClientSpy();
    sut = EventUsecase(httpClient);
    apiResult = EventsFactory.makeListPublicEvent();
  });

  group('EventUsecase - Create', () {
    late CreateEventParams newEvent;
    late File file;

    setUp(() {
      httpClient.mockRequestPostWithFile(true);
      newEvent = ParamsFactory.makeCreateEventParams();
    });

    setUpAll(() {
      file = File('lib/ui/assets/icon/favicon.png');

      registerFallbackValue(file);
    });

    test('Should call HttpClient with correct values', () async {
      await sut.create(newEvent);

      verify(() => httpClient.postWithFile(url: '/eventos', body: newEvent.toJson(), file: newEvent.image));
    });

    test('Should return true if HttpClients returns 201', () async {
      final response = await sut.create(newEvent);

      expect(response, true);
    });

    test('Should return DomainError.unexpected when HttpClient return error', () async {
      httpClient.mockRequestPostWithFileError(HttpError.badRequest);

      final response = sut.create(newEvent);

      expect(response, throwsA(DomainError.unexpected));
    });
  });

  group('EventUsecase - GetPublicEvents', () {
    setUp(() {
      httpClient.mockRequestGetWithParameters(apiResult);
    });

    test('Should call HttpClient with correct values with no PerPage', () async {
      final queryParameter = {
        "page": '1',
        "per_page": '10',
      };
      await sut.getPublics(page: '1');

      verify(() => httpClient.get('eventos/all', queryParameters: queryParameter));
    });

    test('Should call HttpClient with correct values with PerPage', () async {
      final queryParameter = {
        "page": '1',
        "per_page": '15',
      };
      await sut.getPublics(page: '1', perPage: '15');

      verify(() => httpClient.get('eventos/all', queryParameters: queryParameter));
    });

    test('Should return List<EventEntity if HttpClient returns 200>', () async {
      final response = await sut.getPublics(page: '1');

      expect(response, isA<List<EventEntity>>());
    });

    test('Should return Domain Enexpected error when http throws error', () {
      httpClient.mockRequestGetWithParametersError(HttpError.serverError);

      final response = sut.getPublics(page: '1');

      expect(response, throwsA(DomainError.unexpected));
    });
  });

  group('EventUsecase - GetPrimiumEvents', () {
    setUp(() {
      httpClient.mockRequestGet(apiResult);
    });
    test('Should call HttpClient with correct values', () async {
      await sut.getPremiums();

      verify(() => httpClient.get('eventos/destaques'));
    });

    test('Should return List<EventEntity if HttpClient returns 200>', () async {
      final response = await sut.getPremiums();

      expect(response, isA<List<EventEntity>>());
    });

    test('Should return Domain Enexpected error when http throws error', () {
      httpClient.mockRequestGetWithParametersError(HttpError.serverError);

      final response = sut.getPremiums();

      expect(response, throwsA(DomainError.unexpected));
    });
  });
}
