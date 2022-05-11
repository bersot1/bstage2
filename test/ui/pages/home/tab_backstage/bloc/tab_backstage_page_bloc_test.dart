import 'package:bloc_test/bloc_test.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/mock_data/event_entity_factory.dart';
import 'package:bstage2/mock_data/user_entity_factory.dart';
import 'package:bstage2/ui/pages/home/home.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/event_remote_usecase_spy.dart';
import '../../../../mocks/user_local_usecase_spy.dart';

void main() {
  late TabBackstageBloc bloc;
  late EventRemoteUsecaseSpy eventUsecases;
  late UserLocalUsecaseSpy userLocalUsecases;
  late UserEntity user;
  late List<EventEntity> eventsAsProdutor, eventsAsPromoter;

  setUp(() {
    user = UserEntityFactory.makeNewUserEntity();
    eventsAsProdutor = [
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
    ];
    eventsAsPromoter = [
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
      EventsFactory.makeEventEntity(),
    ];
    eventUsecases = EventRemoteUsecaseSpy();
    userLocalUsecases = UserLocalUsecaseSpy();
    bloc = TabBackstageBloc(eventUsecases: eventUsecases, userLocalUsecase: userLocalUsecases);
    userLocalUsecases.mockCallGetCurrentUser(user);
    eventUsecases.mockCallGetAllEventAsCreatorByUser(eventsAsProdutor);
    eventUsecases.mockCallGetAllEventAsPromoterByUser(eventsAsPromoter);
  });

  blocTest(
    'Should call method with correct values',
    build: () => bloc,
    act: (_) => bloc.add(TabBackstageGetDataEvent()),
    verify: (_) {
      verify(() => eventUsecases.getAllEventAsCreatorByUser(idUser: user.id));
    },
  );

  blocTest(
    'Should emits [TabBackstageLoadingState, TabBackstageSuccessState] when 200',
    build: () => bloc,
    act: (_) => bloc.add(TabBackstageGetDataEvent()),
    expect: () => [
      isA<TabBackstageLoadingState>(),
      TabBackstageSuccessState(myEventsAsCreator: eventsAsProdutor, myEventsAsPromoter: eventsAsPromoter),
    ],
  );

  blocTest(
    'Should emits [TabBackstageLoadingState, TabBackstageErrorState] when throws',
    build: () {
      eventUsecases.mockCallGetAllEventAsCreatorByUserError(DomainError.unexpected);
      return bloc;
    },
    act: (_) => bloc.add(TabBackstageGetDataEvent()),
    expect: () => [
      isA<TabBackstageLoadingState>(),
      isA<TabBackstageErrorState>(),
    ],
  );
}
