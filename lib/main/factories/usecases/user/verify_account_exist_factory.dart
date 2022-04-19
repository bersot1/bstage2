import 'package:bstage2/data/data.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/main/factories/http/api_url_factory.dart';
import 'package:bstage2/main/factories/http/http_client_factory.dart';

IVerifyAccountExistUsecase makeVerifyAccountUsecase() => VerifyAccountExistUsecase(
      httpClient: makeHttpAdapter(),
      url: makeApiUrl('perfils/all'),
    );
