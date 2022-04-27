import 'package:bstage2/data/models/event_user_was_invited_model.dart';
import 'package:bstage2/mock_data/event_entity_factory.dart';
import 'package:faker/faker.dart';

class EventUserWasInvitedModelFactory {
  static List<EventUserWasInvitedModel> makeEventsToBePromoter() => [
        makeEventUserWasInvitedModel(),
        makeEventUserWasInvitedModel(),
        makeEventUserWasInvitedModel(),
        makeEventUserWasInvitedModel(),
        makeEventUserWasInvitedModel(),
      ];

  static List<EventUserWasInvitedModel> makeEventsToGo() => [
        makeEventUserWasInvitedModel(),
        makeEventUserWasInvitedModel(),
        makeEventUserWasInvitedModel(),
        makeEventUserWasInvitedModel(),
        makeEventUserWasInvitedModel(),
      ];

  static List<Map<String, dynamic>> makeListMapEventUserWasInvitedModel() => [
        EventUserWasInvitedModelFactory.makeEventUserWasInvitedModel().toJson(),
        EventUserWasInvitedModelFactory.makeEventUserWasInvitedModel().toJson(),
        EventUserWasInvitedModelFactory.makeEventUserWasInvitedModel().toJson(),
        EventUserWasInvitedModelFactory.makeEventUserWasInvitedModel().toJson(),
        EventUserWasInvitedModelFactory.makeEventUserWasInvitedModel().toJson(),
      ];

  static EventUserWasInvitedModel makeEventUserWasInvitedModel() {
    return EventUserWasInvitedModel(
      invitedBy: faker.person.name(),
      when: faker.date.dateTime(),
      idInvite: faker.guid.guid(),
      event: EventsFactory.makeEventModel(),
    );
  }
}
