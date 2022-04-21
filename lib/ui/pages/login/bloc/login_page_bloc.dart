import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/ui/pages/login/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPageBloc extends Bloc<ILoginPageEvent, ILoginPageState> {
  final IUserLocalUsecase userLocalUsecase;
  final IUserRemoteUsecase userRemoteUsecase;

  LoginPageBloc({
    required this.userLocalUsecase,
    required this.userRemoteUsecase,
  }) : super(LoginPageInitialState()) {
    on<LoginWithFacebookEvent>(loginWithFacebook);
  }

  Future<void> loginWithFacebook(
    LoginWithFacebookEvent event,
    Emitter<ILoginPageState> emit,
  ) async {
    try {
      emit(LoginPageLoading());
      final loginFb = await userRemoteUsecase.loginSocial();
      if (loginFb != null) {
        final accountExist = await userRemoteUsecase.verifyIfUserExist(loginFb.idFacebook);
        if (accountExist != null) {
          await userLocalUsecase.insertUser(accountExist);
          emit(LoginWithFacebookSuccess());
        } else {
          final splitName = loginFb.name.split(' ');
          final createAccountParams = CreateAccountParams(
            name: splitName.first,
            lastName: splitName.getRange(1, splitName.length).join(', ').replaceAll(',', ''),
            email: loginFb.email,
            picture: loginFb.picture,
          );
          final createdUser = await userRemoteUsecase.create(account: createAccountParams);
          await userLocalUsecase.insertUser(createdUser);
          emit(LoginWithFacebookSuccess());
        }
      } else {
        emit(LoginWithFacebookError());
      }
    } on DomainError catch (e) {
      switch (e) {
        case DomainError.emailInUse:
          emit(LoginUserAlreadyCreated());
          //
          break;
        default:
          emit(LoginWithFacebookError());
          break;
      }
    }
  }
}
