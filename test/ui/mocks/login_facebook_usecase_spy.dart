import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/domain/helpers/params/result_login_social_param.dart';
import 'package:mocktail/mocktail.dart';

class LoginFacebookUsecaseSpy extends Mock implements ILoginSocial {
  When mockExecuteCall() => when(() => call());
  void mockCall(ResultLoginSocial? value) => mockExecuteCall().thenAnswer((_) async => value);
  void mockCallError(DomainError error) => mockExecuteCall().thenThrow(error);
}
