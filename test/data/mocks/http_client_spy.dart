import 'package:bstage2/data/http/http.dart';
import 'package:bstage2/data/http/http_client.dart';
import 'package:mocktail/mocktail.dart';

class HttpClientSpy extends Mock implements IHttpClient {
  When mockRequestPostCall() => when(() => post(url: any(named: 'url'), body: any(named: 'body')));
  void mockRequestPost(dynamic data) => mockRequestPostCall().thenAnswer((_) async => data);
  void mockRequestPostError(HttpError error) => mockRequestPostCall().thenThrow(error);

  When mockRequestGetCall() => when(() => get(any()));
  void mockRequestGet(dynamic data) => mockRequestGetCall().thenAnswer((_) async => data);
  void mockRequestGetError(HttpError error) => mockRequestGetCall().thenThrow(error);

  When mockRequestGetWithParametersCall() => when(() => get(any(), queryParameters: any(named: 'queryParameters')));
  void mockRequestGetWithParameters(dynamic data) => mockRequestGetWithParametersCall().thenAnswer((_) async => data);
  void mockRequestGetWithParametersError(HttpError error) => mockRequestGetWithParametersCall().thenThrow(error);

  When mockRequestPostWithFileCall() => when(() => postWithFile(url: any(named: 'url'), body: any(named: 'body'), file: any(named: 'file')));
  void mockRequestPostWithFile(dynamic data) => mockRequestPostWithFileCall().thenAnswer((_) async => data);
  void mockRequestPostWithFileError(HttpError error) => mockRequestPostWithFileCall().thenThrow(error);
}
