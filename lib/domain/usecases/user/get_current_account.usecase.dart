import 'package:bstage2/domain/domain.dart';

abstract class IGetCurrentUsecase {
  Future<UserEntity?> call();
}
