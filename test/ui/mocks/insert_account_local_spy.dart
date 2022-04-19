import 'package:bstage2/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class InsertAccountLocalUsecaseSpy extends Mock implements IInsertAccountLocalUsecase {
  When mockExecuteCall() => when(() => call(any()));
  void mockCall() => mockExecuteCall().thenAnswer((_) async => _);
  void mockCallError(DomainError error) => mockExecuteCall().thenReturn(error);
}
