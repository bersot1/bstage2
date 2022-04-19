import 'package:bstage2/domain/domain.dart';

abstract class ICreateAccountUsecase {
  Future<UserEntity> call({required CreateAccountParams account});
}
