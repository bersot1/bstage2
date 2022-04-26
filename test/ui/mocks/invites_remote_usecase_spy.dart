import 'package:bstage2/data/models/event_user_was_invited_model.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/domain/usecases/invites.dart';
import 'package:mocktail/mocktail.dart';

class InviteRemoteUsecaseSpy extends Mock implements IInvitesUsecase {
  When mockGetEventsToGoExecuteCall() => when(() => getEventsThatUserWasInvitedToGo(any()));
  void mockCallGetEventsToGo(List<EventUserWasInvitedModel> value) =>
      mockGetEventsToGoExecuteCall().thenAnswer((_) async => value);
  void mockCallGetEventsToGoError(DomainError error) => mockGetEventsToGoExecuteCall().thenThrow(error);

  When mockGetEventsToBePromoterExecuteCall() => when(() => getEventsThatUserWasInvitedToBePromoter(any()));
  void mockCallGetEventsToBePromoter(List<EventUserWasInvitedModel> value) =>
      mockGetEventsToBePromoterExecuteCall().thenAnswer((_) async => value);
  void mockCallGetEventsToBePromoterError(DomainError error) => mockGetEventsToBePromoterExecuteCall().thenThrow(error);
}
