import '../../../domain/domain.dart';
import '../../data.dart';

class CreateAccountUsecase implements ICreateAccountUsecase {
  final IHttpClient httpClient;
  final String url;

  CreateAccountUsecase({required this.httpClient, required this.url});

  @override
  Future<UserEntity> call({required CreateAccountParams account}) async {
    final jsonBody = account.toJson();
    try {
      final httpResult = await httpClient.post(url: url, body: jsonBody);
      return UserModel.fromJson(httpResult).toEntity();
    } on HttpError catch (error) {
      throw error == HttpError.badRequest ? DomainError.emailInUse : DomainError.unexpected;
    }
  }
}
