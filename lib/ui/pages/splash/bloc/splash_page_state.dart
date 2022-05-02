import 'package:equatable/equatable.dart';

abstract class ISplashPageState extends Equatable {}

class SplashPageLoadingState extends Equatable implements ISplashPageState {
  @override
  List<Object?> get props => [];
}

class SplashPageUserLoggedState extends Equatable implements ISplashPageState {
  @override
  List<Object?> get props => [];
}

class SplashPageUserNotFoundState extends Equatable implements ISplashPageState {
  @override
  List<Object?> get props => [];
}

class SplashPageUnexpectedErrorState extends Equatable implements ISplashPageState {
  @override
  List<Object?> get props => [];
}
