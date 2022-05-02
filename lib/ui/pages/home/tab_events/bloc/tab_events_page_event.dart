abstract class ITabEventEvents {}

class TabEventsGetDataEvent implements ITabEventEvents {}

class TabEventsSearchEventsEvent implements ITabEventEvents {
  final String value;

  TabEventsSearchEventsEvent({required this.value});
}

class TabEventCloseSearchState implements ITabEventEvents {}

class TabEventsGetMorePublicEventByPage implements ITabEventEvents {
  final String page;

  TabEventsGetMorePublicEventByPage(this.page);
}
