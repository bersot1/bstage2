import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../../../main/main_export.dart';

IUserLocalUsecase makeUserLocalUsecase() => UserLocalUsecase(makeCacheStorage());
