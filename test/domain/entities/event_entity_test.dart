import 'package:bstage2/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

import '../factory/event_entity_factory.dart';

main() {
  late EventEntity event;
  test('Event.props', () {
    event = EventsFactory.makeEventEntity();

    expect(event.props, [
      event.id,
      event.name,
      event.description,
      event.highlightedUntil,
      event.start,
      event.end,
      event.contactPhone,
      event.address,
      event.idCreator,
      event.idCategory,
      event.promoterDescription,
      event.image,
      event.minimumAge,
      event.eventType
    ]);
  });
}
