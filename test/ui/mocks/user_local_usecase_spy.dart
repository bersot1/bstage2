import 'package:bstage2/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class UserLocalUsecaseSpy extends Mock implements IUserLocalUsecase {
  When mockgetCurrentUserExecuteCall() => when(() => getCurrentUser());
  void mockCallGetCurrentUser(UserEntity? user) => mockgetCurrentUserExecuteCall().thenAnswer((_) async => user);
  void mockCallGetCurrentUserError(DomainError error) => mockgetCurrentUserExecuteCall().thenThrow(error);

  When mockInsertUserExecuteCall() => when(() => insertUser(any()));
  void mockCallInsertUser() => mockInsertUserExecuteCall().thenAnswer((_) async => _);
  void mockCallInsertUserError(DomainError error) => mockInsertUserExecuteCall().thenReturn(error);
}
