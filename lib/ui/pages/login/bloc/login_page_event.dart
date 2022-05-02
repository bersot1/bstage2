import 'package:equatable/equatable.dart';

abstract class ILoginPageEvent extends Equatable {}

class LoginWithFacebookEvent extends Equatable implements ILoginPageEvent {
  @override
  List<Object?> get props => [];
}
