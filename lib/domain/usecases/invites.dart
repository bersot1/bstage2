import '../../data/data.dart';

abstract class IInvitesUsecase {
  // returns all events that the user were invited to go to the event
  Future<List<EventUserWasInvitedModel>> getEventsThatUserWasInvitedToGo(String idUser);
  // returns all events that the user were invited to be promoter
  Future<List<EventUserWasInvitedModel>> getEventsThatUserWasInvitedToBePromoter(String idUser);
}
