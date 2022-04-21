import 'package:bstage2/data/data.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/main/factories/http/http_client_factory.dart';
import 'package:bstage2/main/factories/packages/packages.dart';

IUserRemoteUsecase makeUserRemoteUsecase() =>
    UserRemoteUsecase(httpClient: makeHttpAdapter(), fbPackage: makeFbPackage());
