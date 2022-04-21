import 'package:bstage2/data/data.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/main/factories/cache/cache.dart';

IUserLocalUsecase makeUserLocalUsecase() => UserLocalUsecase(makeCacheStorage());
