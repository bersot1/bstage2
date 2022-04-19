import 'dart:convert';

import 'package:bstage2/data/cache/cache.dart';
import 'package:bstage2/data/data.dart';
import 'package:bstage2/data/usecases/user/insert_account_local_usecase.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../domain/user_entity_factory.dart';
import '../../mocks/cache_storage_spy.dart';

void main() {
  late InsertAccountLocalUsecase sut;
  late CacheStorageSpy cacheStorage;
  late UserEntity user;

  setUp(() {
    cacheStorage = CacheStorageSpy();
    sut = InsertAccountLocalUsecase(cacheStorage);
    user = UserEntityFactory.makeNewUserEntity();
  });

  test('Should call cacheStorage save with correct values', () async {
    await sut.call(user);
    final userJson = UserModel.fromUserEntity(user).toJson();
    final jsonEncoded = jsonEncode(userJson);
    verify(() => cacheStorage.save(key: CacheKeys.currentAccount, value: jsonEncoded));
  });

  test('Should throws DomainError unexpectec when throws', () {
    cacheStorage.mockSaveError();
    final result = sut.call(user);
    expect(result, throwsA(DomainError.unexpected));
  });
}
