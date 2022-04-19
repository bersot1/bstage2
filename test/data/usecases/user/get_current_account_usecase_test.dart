import 'dart:convert';

import 'package:bstage2/data/cache/cache.dart';
import 'package:bstage2/data/usecases/user/get_current_account_usecase.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../domain/user_entity_factory.dart';
import '../../mocks/cache_storage_spy.dart';

void main() {
  late GetCurrentAccount sut;
  late CacheStorageSpy cacheStorage;
  late String returnCache;

  setUp(() {
    cacheStorage = CacheStorageSpy();
    returnCache = jsonEncode(UserEntityFactory.makeNewUser());
    cacheStorage.mockGet(returnCache);
    sut = GetCurrentAccount(cacheStorage);
  });

  test('Should call CacheStorage with correct values', () async {
    await sut.call();
    verify(() => cacheStorage.get(CacheKeys.currentAccount));
  });

  test('Should return UserEntity when cache return value', () async {
    final result = await sut.call();

    expect(result, isA<UserEntity>());
  });

  test('Should return null when cache return without value', () async {
    cacheStorage.mockGet(null);
    final result = await sut.call();

    expect(result, null);
  });

  test('Should return expected error when throws', () async {
    cacheStorage.mockGetError();
    final result = sut.call();
    expect(result, throwsA(DomainError.unexpected));
  });
}
