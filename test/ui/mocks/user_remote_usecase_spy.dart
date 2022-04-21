import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/domain/helpers/params/result_login_social_param.dart';
import 'package:mocktail/mocktail.dart';

class UserRemoteUsecaseSpy extends Mock implements IUserRemoteUsecase {
  When mockCreateExecuteCall() => when(() => create(account: any(named: 'account')));
  void mockCallCreate(UserEntity value) => mockCreateExecuteCall().thenAnswer((_) async => value);
  void mockCallCreateError(DomainError error) => mockCreateExecuteCall().thenThrow(error);

  When mockLoginSocialExecuteCall() => when(() => loginSocial());
  void mockCallLoginSocial(ResultLoginSocial? value) => mockLoginSocialExecuteCall().thenAnswer((_) async => value);
  void mockCallLoginSocialError(DomainError error) => mockLoginSocialExecuteCall().thenThrow(error);

  When mockVerifyIfUserExistExecuteCall() => when(() => verifyIfUserExist(any()));
  void mockCallVerifyIfUserExist(UserEntity? user) => mockVerifyIfUserExistExecuteCall().thenAnswer((_) async => user);
  void mockCallVerifyIfUserExistError(DomainError error) => mockVerifyIfUserExistExecuteCall().thenThrow(error);
}
