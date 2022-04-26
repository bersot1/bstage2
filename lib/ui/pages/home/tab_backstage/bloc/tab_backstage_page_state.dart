import 'package:bstage2/domain/domain.dart';
import 'package:equatable/equatable.dart';

abstract class ITabBackstageState {}

class TabBackstageLoadingState implements ITabBackstageState {}

class TabBackstageErrorState implements ITabBackstageState {}

class TabBackstageSuccessState extends Equatable implements ITabBackstageState {
  final List<EventEntity> myEvents;

  const TabBackstageSuccessState(this.myEvents);

  @override
  List<Object?> get props => [myEvents];
}
