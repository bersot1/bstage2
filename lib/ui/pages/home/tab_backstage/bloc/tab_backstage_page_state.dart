import 'package:bstage2/domain/domain.dart';
import 'package:equatable/equatable.dart';

abstract class ITabBackstageState {}

class TabBackstageLoadingState implements ITabBackstageState {}

class TabBackstageErrorState implements ITabBackstageState {}

class TabBackstageSuccessState extends Equatable implements ITabBackstageState {
  final List<EventEntity> myEventsAsCreator;
  final List<EventEntity> myEventsAsPromoter;

  const TabBackstageSuccessState({required this.myEventsAsCreator, required this.myEventsAsPromoter});

  @override
  List<Object?> get props => [myEventsAsCreator, myEventsAsPromoter];
}
