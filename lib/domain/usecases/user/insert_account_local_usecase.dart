import 'package:bstage2/domain/domain.dart';

abstract class IInsertAccountLocalUsecase {
  Future<void> call(UserEntity user);
}
