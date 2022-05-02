import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/mock_data/event_entity_factory.dart';

class EventUsecaseMock implements IEventUsecases {
  @override
  Future<bool> create(CreateEventParams param) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<List<EventEntity>> getAllEventAsCreatorByUser({required String idUser}) {
    List<EventEntity> events = [];
    events = [
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
    ];
    return Future.value(events);
  }

  @override
  Future<List<EventEntity>> getPremiums() {
    List<EventEntity> events = [];
    events = [
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
    ];
    return Future.value(events);
  }

  @override
  Future<List<EventEntity>> getPublics({required String page, String perPage = '1'}) async {
    List<EventEntity> events = [];
    events = [
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
    ];
    await Future.delayed(Duration(seconds: 1));
    return Future.value(events);
    // throw Exception();
  }

  @override
  Future<List<EventEntity>> getAll({String? sort, String? filter}) async {
    List<EventEntity> events = [];
    events = [
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
    ];
    await Future.delayed(Duration(seconds: 3));
    return Future.value(events);
  }
}
