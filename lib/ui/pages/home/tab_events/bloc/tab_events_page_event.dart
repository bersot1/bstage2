import 'package:bstage2/domain/domain.dart';

abstract class ITabEventEvents {}

class TabEventsGetDataEvent implements ITabEventEvents {}

class TabEventsSearchEventsEvent implements ITabEventEvents {
  final List<EventEntity> events;
  final String value;

  TabEventsSearchEventsEvent({required this.events, required this.value});
}

class TabEventsGetMorePublicEventByPage implements ITabEventEvents {
  final String page;

  TabEventsGetMorePublicEventByPage(this.page);
}
