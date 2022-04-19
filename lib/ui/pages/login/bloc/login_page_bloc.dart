import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/domain/usecases/user/login_social_usecase.dart';
import 'package:bstage2/ui/pages/login/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPageBloc extends Bloc<ILoginPageEvent, ILoginPageState> {
  final ILoginSocial loginSocial;
  final ICreateAccountUsecase createAccountUsecase;
  final IInsertAccountLocalUsecase insertAccountLocalUsecase;
  final IVerifyAccountExistUsecase verifyAccountExistUsecase;
  LoginPageBloc({
    required this.loginSocial,
    required this.createAccountUsecase,
    required this.insertAccountLocalUsecase,
    required this.verifyAccountExistUsecase,
  }) : super(LoginPageInitialState()) {
    on<LoginWithFacebookEvent>(loginWithFacebook);
  }

  Future<void> loginWithFacebook(
    LoginWithFacebookEvent event,
    Emitter<ILoginPageState> emit,
  ) async {
    try {
      emit(LoginPageLoading());
      final loginFb = await loginSocial.call();
      if (loginFb != null) {
        final accountExist = await verifyAccountExistUsecase(loginFb.idFacebook);
        if (accountExist != null) {
          await insertAccountLocalUsecase.call(accountExist);
          emit(LoginWithFacebookSuccess());
        } else {
          final splitName = loginFb.name.split(' ');
          final createAccountParams = CreateAccountParams(
            name: splitName.first,
            lastName: splitName.getRange(1, splitName.length).join(', ').replaceAll(',', ''),
            email: loginFb.email,
            picture: loginFb.picture,
          );
          final createdUser = await createAccountUsecase.call(account: createAccountParams);
          await insertAccountLocalUsecase.call(createdUser);
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

  UserEntity? _verifyAccountExist(String idFacebook) {}
}
