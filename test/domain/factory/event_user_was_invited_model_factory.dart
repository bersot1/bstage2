import 'package:bstage2/data/models/event_user_was_invited_model.dart';
import 'package:faker/faker.dart';

import 'event_entity_factory.dart';

class EventUserWasInvitedModelFactory {
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
