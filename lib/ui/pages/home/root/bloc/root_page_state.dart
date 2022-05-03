import 'package:equatable/equatable.dart';

abstract class IRootPageEvent {}

class RootPageTabEvent extends Equatable implements IRootPageEvent {
  @override
  List<Object?> get props => [];
}

class RootPageTabInvitation extends Equatable implements IRootPageEvent {
  @override
  List<Object?> get props => [];
}

class RootPageTabBackstage extends Equatable implements IRootPageEvent {
  @override
  List<Object?> get props => [];
}

class RootPageTabProfile extends Equatable implements IRootPageEvent {
  @override
  List<Object?> get props => [];
}
