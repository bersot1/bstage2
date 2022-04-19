import '../../../../data/data.dart';
import '../../../../domain/domain.dart';
import '../../../factories/factories.dart';

IGetCurrentUsecase makeGetCurrentUsecase() => GetCurrentAccount(makeCacheStorage());
