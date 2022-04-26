import 'package:bstage2/data/models/event_user_was_invited_model.dart';
import 'package:equatable/equatable.dart';

abstract class ITabInvitationsState {}

class TabInvitationLoadingState implements ITabInvitationsState {}

class TabInvitationErrorState implements ITabInvitationsState {}

class TabInvitationSuccessState extends Equatable implements ITabInvitationsState {
  final List<EventUserWasInvitedModel> eventsToGo;
  final List<EventUserWasInvitedModel> eventsToBePromoter;

  const TabInvitationSuccessState({required this.eventsToGo, required this.eventsToBePromoter});

  @override
  List<Object?> get props => [eventsToGo, eventsToBePromoter];
}
