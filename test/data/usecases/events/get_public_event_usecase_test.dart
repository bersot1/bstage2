import 'package:bstage2/data/http/http_error.dart';
import 'package:bstage2/data/usecases/events/get_public_event_usecase.dart';
import 'package:bstage2/domain/entities/entities.dart';
import 'package:bstage2/domain/helpers/domain_error.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../domain/event_entity_factory.dart';
import '../../mocks/http_client_spy.dart';

void main() {
  late GetPublicEventUsecase sut;
  late HttpClientSpy httpClient;
  late String url;
  late List<Map> apiResult;

  setUp(() {
    url = faker.internet.httpUrl();
    apiResult = EventsFactory.makeListPublicEvent();

    httpClient = HttpClientSpy();
    httpClient.mockRequestGet(apiResult);
    sut = GetPublicEventUsecase(httpClient: httpClient, url: url);
  });

  test('Should call HttpClient with correct values', () async {
    await sut();

    verify(() => httpClient.get(url));
  });

  test('Should return List<EventEntity if HttpClient returns 200>', () async {
    final response = await sut();

    expect(response, isA<List<EventEntity>>());
  });

  test('Should return Domain Enexpected error when http throws error', () {
    httpClient.mockRequestGetError(HttpError.serverError);

    final response = sut();

    expect(response, throwsA(DomainError.unexpected));
  });
}
