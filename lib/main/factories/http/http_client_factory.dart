import 'package:bstage2/data/data.dart';
import 'package:bstage2/infra/http/http_adapter_dio.dart';
import 'package:dio/dio.dart';

IHttpClient makeHttpAdapter() => HttpAdapterDio(Dio());
