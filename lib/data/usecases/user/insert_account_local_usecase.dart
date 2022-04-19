import 'dart:convert';

import 'package:bstage2/data/cache/cache.dart';
import 'package:bstage2/data/data.dart';
import 'package:bstage2/domain/entities/user_entity.dart';
import 'package:bstage2/domain/helpers/helpers.dart';
import 'package:bstage2/domain/usecases/user/insert_account_local_usecase.dart';

class InsertAccountLocalUsecase implements IInsertAccountLocalUsecase {
  final ICacheStorage cacheStorage;

  InsertAccountLocalUsecase(this.cacheStorage);

  @override
  Future<void> call(UserEntity user) async {
    try {
      final userJson = UserModel.fromUserEntity(user).toJson();
      final userEncoded = jsonEncode(userJson);
      await cacheStorage.save(key: CacheKeys.currentAccount, value: userEncoded);
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
