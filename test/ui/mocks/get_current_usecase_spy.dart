import 'package:bstage2/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class GetCurrentUsecaseSpy extends Mock implements IGetCurrentUsecase {
  When mockRequestCall() => when(() => call());
  void mockCall(UserEntity? user) => mockRequestCall().thenAnswer((_) async => user);
  void mockCallError(DomainError error) => mockRequestCall().thenThrow(error);
}
