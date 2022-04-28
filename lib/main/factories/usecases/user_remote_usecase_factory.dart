import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../../../main/main_export.dart';

IUserRemoteUsecase makeUserRemoteUsecase() =>
    UserRemoteUsecase(httpClient: makeHttpAdapter(), fbPackage: makeFbPackage());
