import '../../../data/data.dart';
import '../../../domain/domain.dart';

class GetPublicEventUsecase implements IGetPublicEvent {
  final IHttpClient httpClient;
  final String url;

  GetPublicEventUsecase({required this.httpClient, required this.url});

  @override
  Future<List<EventEntity>> call() async {
    List<EventEntity> result = [];
    try {
      final httpResponse = await httpClient.get(url) as List;
      result = httpResponse.map((json) => EventModel.fromJson(json).toEntity()).toList();
      return result;
    } on HttpError catch (_) {
      throw DomainError.unexpected;
    }
  }
}
