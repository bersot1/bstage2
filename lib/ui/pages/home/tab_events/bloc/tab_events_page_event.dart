abstract class ITabEventEvents {}

class TabEventsGetDataEvent implements ITabEventEvents {}

class TabEventsGetMorePublicEventByPage implements ITabEventEvents {
  final String page;

  TabEventsGetMorePublicEventByPage(this.page);
}
