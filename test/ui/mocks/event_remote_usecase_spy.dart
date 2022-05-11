import 'package:bstage2/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class EventRemoteUsecaseSpy extends Mock implements IEventUsecases {
  When mockCreateExecuteCall() => when(() => create(any()));
  void mockCallCreate(bool value) => mockCreateExecuteCall().thenAnswer((_) async => value);
  void mockCallCreateError(DomainError error) => mockCreateExecuteCall().thenThrow(error);

  When mockGetPremiumExecuteCall() => when(() => getPremiums());
  void mockCallGetPremium(List<EventEntity> value) => mockGetPremiumExecuteCall().thenAnswer((_) async => value);
  void mockCallGetPremiumError(DomainError error) => mockGetPremiumExecuteCall().thenThrow(error);

  When mockGetPublicsExecuteCall() => when(() => getPublics(page: any(named: 'page')));
  void mockCallGetPublics(List<EventEntity> value) => mockGetPublicsExecuteCall().thenAnswer((_) async => value);
  void mockCallGetPublicsError(DomainError error) => mockGetPublicsExecuteCall().thenThrow(error);

  When mockGetAllEventAsCreatorByUserExecuteCall() =>
      when(() => getAllEventAsCreatorByUser(idUser: any(named: 'idUser')));
  void mockCallGetAllEventAsCreatorByUser(List<EventEntity> value) =>
      mockGetAllEventAsCreatorByUserExecuteCall().thenAnswer((_) async => value);
  void mockCallGetAllEventAsCreatorByUserError(DomainError error) =>
      mockGetAllEventAsCreatorByUserExecuteCall().thenThrow(error);

  When mockGetAllEventAsPromoterByUserExecuteCall() =>
      when(() => getAllEventAsPromoterByUser(idUser: any(named: 'idUser')));
  void mockCallGetAllEventAsPromoterByUser(List<EventEntity> value) =>
      mockGetAllEventAsPromoterByUserExecuteCall().thenAnswer((_) async => value);
  void mockCallGetAllEventAsPromoterByUserError(DomainError error) =>
      mockGetAllEventAsPromoterByUserExecuteCall().thenThrow(error);
}
