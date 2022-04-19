import '../../../data/data.dart';
import '../../../domain/domain.dart';

class CreateEventUsecase implements ICreateEventUsecase {
  final IHttpClient client;
  final String url;

  CreateEventUsecase({required this.client, required this.url});

  @override
  Future<bool> call(CreateEventParams param) async {
    try {
      await client.postWithFile(url: url, body: param.toJson(), file: param.image);
      return true;
    } on HttpError catch (_) {
      throw DomainError.unexpected;
    }
  }
}
