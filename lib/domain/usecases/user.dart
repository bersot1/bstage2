import '../../data/models/models.dart';
import '../domain.dart';

abstract class IUserRemoteUsecase {
  Future<UserEntity> create({required CreateAccountParams account});
  Future<ResultLoginSocial?> loginSocial();
  Future<UserEntity?> verifyIfUserExist(String idFacebook);
  Future<List<InfoGuestEventModel>> getAllGuestByEvent(String idEvent);
}

abstract class IUserLocalUsecase {
  Future<UserEntity?> getCurrentUser();
  Future<void> insertUser(UserEntity user);
}
