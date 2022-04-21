import 'package:bstage2/data/data.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/domain/entities/user_entity.dart';
import 'package:bstage2/domain/helpers/params/create_user_params.dart';
import 'package:bstage2/domain/helpers/params/result_login_social_param.dart';
import 'package:bstage2/domain/usecases/user.dart';

class UserRemoteUsecase implements IUserRemoteUsecase {
  final IHttpClient httpClient;
  final IFacebookPackage fbPackage;

  UserRemoteUsecase({required this.httpClient, required this.fbPackage});

  @override
  Future<UserEntity> create({required CreateAccountParams account}) async {
    final jsonBody = account.toJson();
    try {
      final httpResult = await httpClient.post(url: 'perfil', body: jsonBody);
      return UserModel.fromJson(httpResult).toEntity();
    } on HttpError catch (error) {
      throw error == HttpError.badRequest ? DomainError.emailInUse : DomainError.unexpected;
    }
  }

  @override
  Future<ResultLoginSocial?> loginSocial() async {
    late ResultLoginSocial newUser;
    try {
      final loginResult = await fbPackage.login();

      if (loginResult) {
        final _userData = await fbPackage.getUserData();
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

  @override
  Future<UserEntity?> verifyIfUserExist(String idFacebook) async {
    try {
      final queryParameter = {
        'filter': "IdFacebook:=:$idFacebook",
      };
      final apiResponse = await httpClient.get('perfils/all', queryParameters: queryParameter);

      if (apiResponse.length > 0) {
        return UserModel.fromJson(apiResponse[0]).toEntity();
      }

      return null;
    } catch (e) {
      throw DomainError.unexpected;
    }
  }
}
