import 'package:bstage2/domain/helpers/params/result_login_social_param.dart';

import '../domain.dart';

abstract class IUserRemoteUsecase {
  Future<UserEntity> create({required CreateAccountParams account});
  Future<ResultLoginSocial?> loginSocial();
  Future<UserEntity?> verifyIfUserExist(String idFacebook);
}

abstract class IUserLocalUsecase {
  Future<UserEntity?> getCurrentUser();
  Future<void> insertUser(UserEntity user);
}
