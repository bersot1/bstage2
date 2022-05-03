import 'package:bstage2/domain/entities/user_entity.dart';
import 'package:bstage2/domain/usecases/user.dart';
import 'package:bstage2/mock_data/user_entity_factory.dart';
import 'package:flutter/material.dart';

class UserLocalUsecaseMock implements IUserLocalUsecase {
  @override
  Future<UserEntity?> getCurrentUser() async {
    return Future.value(UserEntityFactory.makeNewUserEntity());
  }

  @override
  Future<void> insertUser(UserEntity user) async {
    debugPrint('inser event');
  }
}
