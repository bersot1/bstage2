import 'dart:convert';

import 'package:bstage2/data/data.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/factory/user_entity_factory.dart';
import '../spys/cache_storage_spy.dart';

void main() {
  late UserLocalUsecase sut;
  late CacheStorageSpy cacheStorage;

  setUp(() {
    cacheStorage = CacheStorageSpy();
    sut = UserLocalUsecase(cacheStorage);
  });

  group('GetCurrentAccount - ', () {
    late String returnCache;

    setUp(() {
      returnCache = jsonEncode(UserEntityFactory.makeNewUser());
      cacheStorage.mockGet(returnCache);
    });

    test('Should call CacheStorage with correct values', () async {
      await sut.getCurrentUser();
      verify(() => cacheStorage.get(CacheKeys.currentAccount));
      expect(CacheKeys.currentAccount, 'currentAccount');
    });

    test('Should return UserEntity when cache return value', () async {
      final result = await sut.getCurrentUser();

      expect(result, isA<UserEntity>());
    });

    test('Should return null when cache return without value', () async {
      cacheStorage.mockGet(null);
      final result = await sut.getCurrentUser();

      expect(result, null);
    });

    test('Should return expected error when throws', () async {
      cacheStorage.mockGetError();
      final result = sut.getCurrentUser();
      expect(result, throwsA(DomainError.unexpected));
    });
  });

  group('InsertAccountLocal', () {
    late UserEntity user;

    setUp(() {
      user = UserEntityFactory.makeNewUserEntity();
    });

    test('Should call cacheStorage save with correct values', () async {
      await sut.insertUser(user);
      final userJson = UserModel.fromUserEntity(user).toJson();
      final jsonEncoded = jsonEncode(userJson);
      verify(() => cacheStorage.save(key: CacheKeys.currentAccount, value: jsonEncoded));
      expect(CacheKeys.currentAccount, 'currentAccount');
    });

    test('Should throws DomainError unexpectec when throws', () {
      cacheStorage.mockSaveError();
      final result = sut.insertUser(user);
      expect(result, throwsA(DomainError.unexpected));
    });
  });
}
