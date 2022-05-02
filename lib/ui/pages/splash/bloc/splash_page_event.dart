import 'package:equatable/equatable.dart';

abstract class ISplashPageEvent extends Equatable {}

class SplashPageStartEvent extends Equatable implements ISplashPageEvent {
  @override
  List<Object?> get props => [];
}
