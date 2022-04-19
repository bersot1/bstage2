import 'dart:convert';

import '../../../data/data.dart';
import '../../../domain/domain.dart';

class GetCurrentAccount implements IGetCurrentUsecase {
  final ICacheStorage cacheStorage;

  GetCurrentAccount(this.cacheStorage);

  @override
  Future<UserEntity?> call() async {
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
}
