import 'package:dio/dio.dart';

import '../../../data/data.dart';
import '../../../infra/infra.dart';

IHttpClient makeHttpAdapter() => HttpAdapterDio(Dio());
