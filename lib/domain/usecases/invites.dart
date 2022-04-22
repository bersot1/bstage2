import 'package:bstage2/data/models/event_user_was_invited_model.dart';

abstract class IInvitesUsecase {
  // returns all events that the user were invited to go to the event
  Future<List<EventUserWasInvitedModel>> getEventsThatUserWasInvitedToGo(String idPerfil);
  // returns all events that the user were invited to be promoter
  Future<List<EventUserWasInvitedModel>> getEventsThatUserWasInvitedToBePromoter(String idPerfil);
}
