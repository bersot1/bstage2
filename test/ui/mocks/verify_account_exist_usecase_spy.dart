import 'package:bstage2/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class VerifyAccountExistUsecaseSpy extends Mock implements IVerifyAccountExistUsecase {
  When mockExecuteCall() => when(() => call(any()));
  void mockCall(UserEntity? user) => mockExecuteCall().thenAnswer((_) async => user);
  void mockCallError(DomainError error) => mockExecuteCall().thenThrow(error);
}
