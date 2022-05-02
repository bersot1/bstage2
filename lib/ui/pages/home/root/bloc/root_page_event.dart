import 'package:equatable/equatable.dart';

abstract class IRootPageEvent {}

class RootPageTabEventEvent extends Equatable implements IRootPageEvent {
  @override
  List<Object?> get props => [];
}

class RootPageTabBackstageEvent extends Equatable implements IRootPageEvent {
  @override
  List<Object?> get props => [];
}

class RootPageTabInvitationsEvent extends Equatable implements IRootPageEvent {
  @override
  List<Object?> get props => [];
}

class RootPageTabProfileEvent extends Equatable implements IRootPageEvent {
  @override
  List<Object?> get props => [];
}
