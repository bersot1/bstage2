import 'package:bstage2/data/models/event_user_was_invited_model.dart';
import 'package:bstage2/domain/usecases/invites.dart';
import 'package:bstage2/mock_data/event_user_was_invited_model_factory.dart';

class InviteUsecaseMock implements IInvitesUsecase {
  @override
  Future<List<EventUserWasInvitedModel>> getEventsThatUserWasInvitedToBePromoter(String idUser) {
    return Future.value(EventUserWasInvitedModelFactory.makeEventsToBePromoter());
  }

  @override
  Future<List<EventUserWasInvitedModel>> getEventsThatUserWasInvitedToGo(String idUser) {
    return Future.value(EventUserWasInvitedModelFactory.makeEventsToGo());
  }
}
