import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/ui/pages/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabEventBloc extends Bloc<ITabEventEvents, ITabEventState> {
  final IEventUsecases eventUsecases;
  TabEventBloc({required this.eventUsecases}) : super(TabEventLoadingState()) {
    on<TabEventsGetDataEvent>(getAllData);
    on<TabEventsGetMorePublicEventByPage>(getMorePublicsEventsByPage);
    on<TabEventsSearchEventsEvent>(searchEvents);
  }

  late List<EventEntity> _publicEvents;
  late List<EventEntity> _premiumEvents;

  Future<void> getAllData(
    TabEventsGetDataEvent event,
    Emitter<ITabEventState> emit,
  ) async {
    try {
      emit(TabEventLoadingState());
      _premiumEvents = await getPremiumEvent();
      _publicEvents = await getPublicEvent();
      emit(TabEventSuccessState(publicEvents: _publicEvents, premiumEvents: _premiumEvents));
    } catch (_) {
      emit(TabEventErrorState());
    }
  }

  Future<void> getMorePublicsEventsByPage(
    TabEventsGetMorePublicEventByPage event,
    Emitter<ITabEventState> emit,
  ) async {
    try {
      emit(TabEventLoadingMorePublicEventState());
      final publicEvent = await getPublicEvent(page: event.page);
      if (publicEvent.isEmpty) {
        emit(TabEventNoMorePublicEventState());
      } else {
        _publicEvents += publicEvent;
        emit(TabEventSuccessMorePublicEventState(publicEvents: _publicEvents));
      }
    } catch (_) {
      emit(TabEventErrorMorePublicEventState());
    }
  }

  Future<void> searchEvents(
    TabEventsSearchEventsEvent event,
    Emitter<ITabEventState> emit,
  ) async {
    if (event.value.isEmpty) {
      TabEventSuccessState(publicEvents: _publicEvents, premiumEvents: _premiumEvents);
    } else {
      emit(TabEventSearchEventState([]));
    }
  }

  Future<List<EventEntity>> getPublicEvent({String page = '1'}) async {
    try {
      return await eventUsecases.getPublics(page: page);
    } catch (_) {
      throw Exception();
    }
  }

  Future<List<EventEntity>> getPremiumEvent() async {
    try {
      return await eventUsecases.getPremiums();
    } catch (_) {
      throw Exception();
    }
  }
}
