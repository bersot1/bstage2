import 'package:bstage2/data/data.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/domain/helpers/helpers.dart';
import 'package:bstage2/domain/usecases/user/verify_account_exist_usecase.dart';

class VerifyAccountExistUsecase implements IVerifyAccountExistUsecase {
  final IHttpClient httpClient;
  final String url; // Perfils/all

  VerifyAccountExistUsecase({
    required this.httpClient,
    required this.url,
  });

  @override
  Future<UserEntity?> call(String idFacebook) async {
    try {
      final queryParameter = {
        'filter': "IdFacebook:=:$idFacebook",
      };
      final apiResponse = await httpClient.get(url, queryParameters: queryParameter);

      if (apiResponse.length > 0) {
        return UserModel.fromJson(apiResponse[0]).toEntity();
      }

      return null;
    } catch (e) {
      throw DomainError.unexpected;
    }
  }
}
