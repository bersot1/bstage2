import 'package:bstage2/domain/domain.dart';

abstract class IVerifyAccountExistUsecase {
  Future<UserEntity?> call(String idFacebook);
}
