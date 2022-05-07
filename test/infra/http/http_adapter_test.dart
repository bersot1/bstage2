import 'package:bstage2/data/http/http_error.dart';
import 'package:bstage2/infra/http/http_adapter_dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/dio_spy.dart';

void main() {
  late HttpAdapterDio sut;
  late DioSpy client;
  late String url;

  setUp(() {
    client = DioSpy();
    sut = HttpAdapterDio(client);
  });

  setUpAll(() {
    url = faker.internet.httpUrl();
    registerFallbackValue(Uri.parse(url));
  });

  group('post', () {
    test('Should call post with correct values', () async {
      await sut.post(url: url, body: {'any_key': 'any_value'});
      verify(() => client.post(url, data: {"any_key": "any_value"}));
    });
    test('Should call post without body', () async {
      await sut.post(url: url);
      verify(() => client.post(url));
    });
    test('Should return data if post returns 200', () async {
      final response = await sut.post(url: url);

      expect(response, {"any_key": "any_value"});
    });

    test('Should return null if post returns 200 with no data', () async {
      client.mockPost(200, body: '');

      final response = await sut.post(url: url);

      expect(response, null);
    });

    test('Should return BadRequestError if post returns 400', () {
      client.mockPost(400);

      final response = sut.post(url: url);

      expect(response, throwsA(HttpError.badRequest));
    });
    test('Should return UnauthorizedError if post returns 401', () {
      client.mockPost(401);

      final response = sut.post(url: url);

      expect(response, throwsA(HttpError.unauthorized));
    });
    test('Should return ForbiddenErro if post returns 403', () {
      client.mockPost(403);

      final response = sut.post(url: url);

      expect(response, throwsA(HttpError.forbidden));
    });
    test('Should return NotFoundError if post returns 404', () {
      client.mockPost(404);

      final response = sut.post(url: url);

      expect(response, throwsA(HttpError.notFound));
    });
    test('Should return ServerError if post returns 500', () {
      client.mockPost(500);

      final response = sut.post(url: url);

      expect(response, throwsA(HttpError.serverError));
    });
    test('Should return ServerError if post throws', () {
      client.mockPostError();

      final response = sut.post(url: url);

      expect(response, throwsA(HttpError.serverError));
    });

    // test('Should call post Form Data with correct values', () async {
    //   File file = File('lib/ui/assets/icon/favicon512.png');
    //   await sut.postWithFile(url: url, body: {'any_key': 'any_value'}, file: file);
    //   verify(() => client.post(url, data: {"any_key": "any_value"}));
    // });
  });

  group('get', () {
    test('Should call get with correct values', () async {
      final queryParameters = {'any_value': 'any_value'};
      await sut.get(url, queryParameters: queryParameters);
      verify(() => client.get(url, queryParameters: queryParameters));
    });

    test('Should return data if get returns 200', () async {
      final response = await sut.get(url);

      expect(response, {'any_key': 'any_value'});
    });
    test('Should return null if get returns 200 with no data', () async {
      client.mockGet(200, data: '');

      final response = await sut.get(url);

      expect(response, null);
    });
    test('Should return BadRequestError if get returns 400', () {
      client.mockGet(400);

      final response = sut.get(url);

      expect(response, throwsA(HttpError.badRequest));
    });
    test('Should return UnauthorizedError if get returns 401', () {
      client.mockGet(401);

      final response = sut.get(url);

      expect(response, throwsA(HttpError.unauthorized));
    });
    test('Should return ForbiddenErro if get returns 403', () {
      client.mockGet(403);

      final response = sut.get(url);

      expect(response, throwsA(HttpError.forbidden));
    });
    test('Should return NotFoundError if get returns 404', () {
      client.mockGet(404);

      final response = sut.get(url);

      expect(response, throwsA(HttpError.notFound));
    });
    test('Should return ServerError if get returns 500', () {
      client.mockGet(500);

      final response = sut.get(url);

      expect(response, throwsA(HttpError.serverError));
    });
    test('Should return ServerError if get throws', () {
      client.mockGetError();

      final response = sut.get(url);

      expect(response, throwsA(HttpError.serverError));
    });
  });
}
