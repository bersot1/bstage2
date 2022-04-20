import '../../../data/data.dart';
import '../../../domain/domain.dart';

class GetPublicEventUsecase implements IGetPublicEvent {
  final IHttpClient httpClient;
  final String url;

  GetPublicEventUsecase({required this.httpClient, required this.url});

  @override
  Future<List<EventEntity>> call({required String page, String perPage = '10'}) async {
    List<EventEntity> result = [];
    try {
      final queryParameter = {
        "page": page,
        "per_page": perPage,
      };
      final httpResponse = await httpClient.get(url, queryParameters: queryParameter) as List;
      result = httpResponse.map((json) => EventModel.fromJson(json).toEntity()).toList();
      return result;
    } on HttpError catch (_) {
      throw DomainError.unexpected;
    }
  }
}
