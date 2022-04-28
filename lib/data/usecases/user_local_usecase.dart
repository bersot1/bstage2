import 'dart:convert';

import '../../data/data.dart';
import '../../domain/domain.dart';

class UserLocalUsecase implements IUserLocalUsecase {
  final ICacheStorage cacheStorage;

  UserLocalUsecase(this.cacheStorage);

  @override
  Future<UserEntity?> getCurrentUser() async {
    try {
      final result = await cacheStorage.get(CacheKeys.currentAccount);
      if (result == null || result == '') {
        return null;
      }
      final jsonDecoded = jsonDecode(result);
      return UserModel.fromJson(jsonDecoded).toEntity();
    } catch (e) {
      throw DomainError.unexpected;
    }
  }

  @override
  Future<void> insertUser(UserEntity user) async {
    try {
      final userJson = UserModel.fromUserEntity(user).toJson();
      final userEncoded = jsonEncode(userJson);
      await cacheStorage.save(key: CacheKeys.currentAccount, value: userEncoded);
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
