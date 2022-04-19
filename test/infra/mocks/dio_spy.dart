import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class DioSpy extends Mock implements Dio {
  DioSpy() {
    mockPost(200);
    mockPut(200);
    mockGet(200);
  }

  When mockPostCall() => when(() => post(any(), data: any(named: 'data')));
  void mockPost(
    int statusCode, {
    String body = '{"any_key": "any_value"}',
  }) =>
      mockPostCall().thenAnswer((_) async => Response(data: body, statusCode: statusCode, requestOptions: RequestOptions(path: '')));
  void mockPostError() => when(() => mockPostCall().thenThrow(Exception()));

  When mockPutCall() => when(() => put(any(), data: any(named: 'data')));
  void mockPut(int statusCode, {String body = '{"any_key": "any_value"}'}) =>
      mockPutCall().thenAnswer((_) async => Response(data: body, statusCode: statusCode, requestOptions: RequestOptions(path: '')));
  void mockPutError() => when(() => mockPutCall().thenThrow(Exception()));

  When mockGetCall() => when(() => get(any(), queryParameters: any(named: 'queryParameters')));
  void mockGet(int statusCode, {String data = '{"any_key": "any_value"}'}) =>
      mockGetCall().thenAnswer((_) async => Response(data: data, statusCode: statusCode, requestOptions: RequestOptions(path: '')));
  void mockGetError() => when(() => mockGetCall().thenThrow(Exception()));
}
