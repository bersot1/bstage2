import 'package:bloc_test/bloc_test.dart';
import 'package:bstage2/data/models/event_user_was_invited_model.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/ui/pages/home/tab_invitations/tab_invitations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../domain/factory/event_user_was_invited_model_factory.dart';
import '../../../../../domain/factory/user_entity_factory.dart';
import '../../../../mocks/invites_remote_usecase_spy.dart';
import '../../../../mocks/user_local_usecase_spy.dart';

void main() {
  late TabInvitationBloc bloc;

  late InviteRemoteUsecaseSpy invitesUsecase;
  late UserLocalUsecaseSpy userLocalUsecase;

  late UserEntity user;
  late List<EventUserWasInvitedModel> eventsToGo;
  late List<EventUserWasInvitedModel> eventsToBePromoter;

  setUp(() {
    user = UserEntityFactory.makeNewUserEntity();
    eventsToGo = [
      EventUserWasInvitedModelFactory.makeEventUserWasInvitedModel(),
      EventUserWasInvitedModelFactory.makeEventUserWasInvitedModel(),
    ];

    eventsToBePromoter = [
      EventUserWasInvitedModelFactory.makeEventUserWasInvitedModel(),
      EventUserWasInvitedModelFactory.makeEventUserWasInvitedModel(),
    ];

    invitesUsecase = InviteRemoteUsecaseSpy();
    userLocalUsecase = UserLocalUsecaseSpy();
    bloc = TabInvitationBloc(inviteUsecase: invitesUsecase, userLocalUsecase: userLocalUsecase);

    userLocalUsecase.mockCallGetCurrentUser(user);
    invitesUsecase.mockCallGetEventsToBePromoter(eventsToBePromoter);
    invitesUsecase.mockCallGetEventsToGo(eventsToGo);
  });

  blocTest(
    'Should call method eventsToGo with correct values',
    build: () => bloc,
    act: (_) => bloc.add(TabInvitationGetDataEvent()),
    verify: (_) {
      verify(() => invitesUsecase.getEventsThatUserWasInvitedToGo(user.id));
    },
  );

  blocTest(
    'Should call method eventsToBePromoter with correct values',
    build: () => bloc,
    act: (_) => bloc.add(TabInvitationGetDataEvent()),
    verify: (_) {
      verify(() => invitesUsecase.getEventsThatUserWasInvitedToBePromoter(user.id));
    },
  );

  blocTest<TabInvitationBloc, ITabInvitationsState>(
    'Should emits [Loading and success] state when 200',
    build: () => bloc,
    act: (_) => bloc.add(TabInvitationGetDataEvent()),
    expect: () => [
      isA<TabInvitationLoadingState>(),
      TabInvitationSuccessState(
        eventsToBePromoter: eventsToBePromoter,
        eventsToGo: eventsToGo,
      ),
    ],
  );

  blocTest<TabInvitationBloc, ITabInvitationsState>(
    'Should emits [Loading and error] when getCurretUser throws error',
    build: () {
      userLocalUsecase.mockCallGetCurrentUserError(DomainError.unexpected);
      return bloc;
    },
    act: (_) => bloc.add(TabInvitationGetDataEvent()),
    expect: () => [
      isA<TabInvitationLoadingState>(),
      isA<TabInvitationErrorState>(),
    ],
  );

  blocTest<TabInvitationBloc, ITabInvitationsState>(
    'Should emits [Loading and error] when getEventsToGo throws error',
    build: () {
      invitesUsecase.mockCallGetEventsToGoError(DomainError.unexpected);
      return bloc;
    },
    act: (_) => bloc.add(TabInvitationGetDataEvent()),
    expect: () => [
      isA<TabInvitationLoadingState>(),
      isA<TabInvitationErrorState>(),
    ],
  );

  blocTest<TabInvitationBloc, ITabInvitationsState>(
    'Should emits [Loading and error] when getEventsToBePromoter throws error',
    build: () {
      invitesUsecase.mockCallGetEventsToBePromoterError(DomainError.unexpected);
      return bloc;
    },
    act: (_) => bloc.add(TabInvitationGetDataEvent()),
    expect: () => [
      isA<TabInvitationLoadingState>(),
      isA<TabInvitationErrorState>(),
    ],
  );
}
