import 'package:bstage2/data/data.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/domain/helpers/params/result_login_social_param.dart';
import 'package:bstage2/domain/usecases/user/login_social_usecase.dart';

class LoginWithFacebookUsecase implements ILoginSocial {
  final IFacebookPackage package;

  LoginWithFacebookUsecase(this.package);

  @override
  Future<ResultLoginSocial?> call() async {
    late ResultLoginSocial newUser;
    try {
      final loginResult = await package.login();

      if (loginResult) {
        final _userData = await package.getUserData();
        if (_userData != null) {
          newUser = ResultLoginSocial(
            name: _userData['name'],
            email: _userData['email'],
            idFacebook: _userData['id'],
            picture: _userData['picture']['data']['url'],
          );

          return newUser;
        }
      }

      return null;
    } catch (e) {
      throw DomainError.unexpected;
    }
  }
}
