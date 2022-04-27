import 'package:bloc_test/bloc_test.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/mock_data/event_entity_factory.dart';
import 'package:bstage2/ui/pages/home/home.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/event_remote_usecase_spy.dart';

void main() {
  late TabEventBloc tabEventBloc;
  late EventRemoteUsecaseSpy eventUsecases;
  late List<EventEntity> premiumEvents;
  late List<EventEntity> publicEvents;

  setUp(() {
    premiumEvents = [
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
    ];

    publicEvents = [
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
    ];
    eventUsecases = EventRemoteUsecaseSpy();
    tabEventBloc = TabEventBloc(eventUsecases: eventUsecases);

    eventUsecases.mockCallGetPremium(premiumEvents);
    eventUsecases.mockCallGetPublics(publicEvents);
  });

  group('Event - TabEventsGetDataEvent', () {
    blocTest<TabEventBloc, ITabEventState>(
      'Should emit [TabEventLoadingState and TabEventSuccessState] with correct values',
      build: () => tabEventBloc,
      act: (_) => tabEventBloc.add(TabEventsGetDataEvent()),
      expect: () => [
        isA<TabEventLoadingState>(),
        TabEventSuccessState(
          premiumEvents: premiumEvents,
          publicEvents: publicEvents,
        )
      ],
    );

    blocTest(
      'Should emit [TabEventLoadingState and TabEventErrorState] when something is wrong with get Premium Events',
      build: () {
        eventUsecases.mockCallGetPremiumError(DomainError.unexpected);
        return tabEventBloc;
      },
      act: (_) => tabEventBloc.add(TabEventsGetDataEvent()),
      expect: () => [isA<TabEventLoadingState>(), isA<TabEventErrorState>()],
    );

    blocTest(
      'Should emit [TabEventLoadingState and TabEventErrorState] when something is wrong with get Public Events',
      build: () {
        eventUsecases.mockCallGetPublicsError(DomainError.unexpected);
        return tabEventBloc;
      },
      act: (_) => tabEventBloc.add(TabEventsGetDataEvent()),
      expect: () => [isA<TabEventLoadingState>(), isA<TabEventErrorState>()],
    );
  });

  group('Event - TabEventsGetMorePublicEventByPage', () {
    late String page;
    blocTest<TabEventBloc, ITabEventState>('Should call method with correct values', build: () {
      eventUsecases.mockCallGetPublics([]);
      return tabEventBloc;
    }, act: (_) {
      page = faker.randomGenerator.integer(99).toString();
      tabEventBloc.add(TabEventsGetMorePublicEventByPage(page));
    }, verify: (_) {
      verify(() => eventUsecases.getPublics(page: page));
    });

    blocTest<TabEventBloc, ITabEventState>(
      'Should emit [TabEventLoadingMorePublicEventState, TabEventNoMorePublicEventState] with correct values and no more events',
      build: () {
        eventUsecases.mockCallGetPublics([]);
        return tabEventBloc;
      },
      act: (_) => tabEventBloc.add(TabEventsGetMorePublicEventByPage('2')),
      expect: () => [
        isA<TabEventLoadingMorePublicEventState>(),
        isA<TabEventNoMorePublicEventState>(),
      ],
    );

    blocTest<TabEventBloc, ITabEventState>(
      'Should emit [TabEventLoadingMorePublicEventState, TabEventSuccessMorePublicEventState] with correct values and no more events',
      build: () => tabEventBloc,
      act: (_) => tabEventBloc.add(TabEventsGetMorePublicEventByPage('2')),
      expect: () => [
        isA<TabEventLoadingMorePublicEventState>(),
        TabEventSuccessMorePublicEventState(publicEvents: publicEvents),
      ],
    );

    blocTest(
      'Should emit [TabEventLoadingState and TabEventErrorState] when something is wrong with get Premium Events',
      build: () {
        eventUsecases.mockCallGetPublicsError(DomainError.unexpected);
        return tabEventBloc;
      },
      act: (_) => tabEventBloc.add(TabEventsGetMorePublicEventByPage('2')),
      expect: () => [isA<TabEventLoadingMorePublicEventState>(), isA<TabEventErrorMorePublicEventState>()],
    );
  });
}
