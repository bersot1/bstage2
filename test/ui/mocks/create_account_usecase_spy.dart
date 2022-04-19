import 'package:bstage2/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class CreateAccountUsecaseSpy extends Mock implements ICreateAccountUsecase {
  When mockExecuteCall() => when(() => call(account: any(named: 'account')));
  void mockCall(UserEntity value) => mockExecuteCall().thenAnswer((_) async => value);
  void mockCallError(DomainError error) => mockExecuteCall().thenThrow(error);
}
