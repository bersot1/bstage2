import 'package:equatable/equatable.dart';

abstract class ILoginPageState extends Equatable {}

class LoginPageInitialState extends Equatable implements ILoginPageState {
  @override
  List<Object?> get props => [];
}

class LoginWithFacebookSuccess extends Equatable implements ILoginPageState {
  @override
  List<Object?> get props => [];
}

class LoginWithFacebookError extends Equatable implements ILoginPageState {
  @override
  List<Object?> get props => [];
}

class LoginUserAlreadyCreated extends Equatable implements ILoginPageState {
  @override
  List<Object?> get props => [];
}

class LoginPageLoading extends Equatable implements ILoginPageState {
  @override
  List<Object?> get props => [];
}
