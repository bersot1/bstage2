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
  late Map<String, dynamic>? queryParameter;

  setUp(() {
    url = faker.internet.httpUrl();
    apiResult = EventsFactory.makeListPublicEvent();

    httpClient = HttpClientSpy();
    httpClient.mockRequestGetWithParameters(apiResult);
    sut = GetPublicEventUsecase(httpClient: httpClient, url: url);
  });

  test('Should call HttpClient with correct values with no PerPage', () async {
    queryParameter = {
      "page": '1',
      "per_page": '10',
    };
    await sut(page: '1');

    verify(() => httpClient.get(url, queryParameters: queryParameter));
  });

  test('Should call HttpClient with correct values with PerPage', () async {
    queryParameter = {
      "page": '1',
      "per_page": '15',
    };
    await sut(page: '1', perPage: '15');

    verify(() => httpClient.get(url, queryParameters: queryParameter));
  });

  test('Should return List<EventEntity if HttpClient returns 200>', () async {
    final response = await sut(page: '1');

    expect(response, isA<List<EventEntity>>());
  });

  test('Should return Domain Enexpected error when http throws error', () {
    httpClient.mockRequestGetWithParametersError(HttpError.serverError);

    final response = sut(page: '1');

    expect(response, throwsA(DomainError.unexpected));
  });
}
