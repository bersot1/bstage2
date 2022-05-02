import 'package:bstage2/domain/domain.dart';
import 'package:equatable/equatable.dart';

abstract class ITabEventState {}

// ############ Tab Event

class TabEventLoadingState implements ITabEventState {}

class TabEventSuccessState extends Equatable implements ITabEventState {
  final List<EventEntity> publicEvents;
  final List<EventEntity> premiumEvents;

  const TabEventSuccessState({required this.publicEvents, required this.premiumEvents});

  @override
  List<Object?> get props => [publicEvents, premiumEvents];
}

class TabEventErrorState implements ITabEventState {}

class TabEventSearchEventState implements ITabEventState {
  final List<EventEntity> result;

  TabEventSearchEventState(this.result);
}

// ############ Tab Event More Public Event By Page

class TabEventLoadingMorePublicEventState implements ITabEventState {}

class TabEventSuccessMorePublicEventState extends Equatable implements ITabEventState {
  final List<EventEntity> publicEvents;

  const TabEventSuccessMorePublicEventState({required this.publicEvents});

  @override
  List<Object?> get props => [publicEvents];
}

class TabEventNoMorePublicEventState implements ITabEventState {}

class TabEventErrorMorePublicEventState implements ITabEventState {}
