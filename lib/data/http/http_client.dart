import 'dart:io';

enum EnumHttpMethod { get, post, put, delete }

abstract class IHttpClient {
  Future<dynamic> get(String url, {Map<String, dynamic>? queryParameters});

  Future<dynamic> post({
    required String url,
    Map? body,
  });

  Future<dynamic> postWithFile({
    required String url,
    required Map body,
    required File file,
  });
}
