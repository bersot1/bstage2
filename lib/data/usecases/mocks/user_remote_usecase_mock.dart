import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/domain/helpers/params/result_login_social_param.dart';
import 'package:bstage2/mock_data/user_entity_factory.dart';

class UserRemoteUsecaseMock implements IUserRemoteUsecase {
  @override
  Future<UserEntity> create({required CreateAccountParams account}) {
    return Future.value(UserEntityFactory.makeNewUserEntity());
  }

  @override
  Future<ResultLoginSocial?> loginSocial() {
    return Future.value(UserEntityFactory.makeResultLoginSocial());
  }

  @override
  Future<UserEntity?> verifyIfUserExist(String idFacebook) {
    return Future.value(UserEntityFactory.makeNewUserEntity());
  }
}
