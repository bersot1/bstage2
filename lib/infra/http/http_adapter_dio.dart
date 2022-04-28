import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../data/data.dart';

class HttpAdapterDio implements IHttpClient {
  final Dio dio;

  HttpAdapterDio(this.dio);

  @override
  Future get(String url, {Map<String, dynamic>? queryParameters}) async {
    late Response response;
    try {
      response = await dio.get(url, queryParameters: queryParameters);
    } catch (e) {
      throw HttpError.serverError;
    }
    return _handleResponse(response);
  }

  @override
  Future post({required String url, Map? body}) async {
    late Response response;
    try {
      response = await dio.post(url, data: body);
    } catch (e) {
      throw HttpError.serverError;
    }

    return _handleResponse(response);
  }

  // retrofit

  @override
  Future postWithFile({required String url, required Map body, required File file}) async {
    late Response response;
    try {
      String fileName = file.path.split('/').last;

      var jsonBody = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path, filename: fileName),
        "item": body,
      });

      response = await dio.post(url, data: jsonBody);
    } catch (_) {
      throw HttpError.serverError;
    }

    return _handleResponse(response);
  }
}

dynamic _handleResponse(Response response) {
  switch (response.statusCode) {
    case 200:
    case 201:
      return response.data == '' || response.data == null ? null : jsonDecode(response.data);
    case 204:
      throw HttpError.noContent;
    case 400:
      throw HttpError.badRequest;
    case 401:
      throw HttpError.unauthorized;
    case 403:
      throw HttpError.forbidden;
    case 404:
      throw HttpError.notFound;
    default:
      throw HttpError.serverError;
  }
}
