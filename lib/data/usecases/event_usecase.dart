import '../../data/data.dart';
import '../../domain/domain.dart';

class EventUsecase implements IEventUsecases {
  final IHttpClient client;

  EventUsecase(this.client);

  @override
  Future<bool> create(CreateEventParams param) async {
    try {
      const url = '/eventos';
      await client.postWithFile(url: url, body: param.toJson(), file: param.image);
      return true;
    } on HttpError catch (_) {
      throw DomainError.unexpected;
    }
  }

  @override
  Future<List<EventEntity>> getPremiums() async {
    List<EventEntity> result = [];

    try {
      const url = 'eventos/destaques';
      final httpResponse = await client.get(url) as List;
      result = httpResponse.map((json) => EventModel.fromJson(json).toEntity()).toList();
      return result;
    } catch (e) {
      throw DomainError.unexpected;
    }
  }

  @override
  Future<List<EventEntity>> getPublics({required String page, String perPage = '10'}) async {
    List<EventEntity> result = [];
    const url = 'eventos/all';
    try {
      final queryParameter = {
        "page": page,
        "per_page": perPage,
      };
      final httpResponse = await client.get(url, queryParameters: queryParameter) as List;
      result = httpResponse.map((json) => EventModel.fromJson(json).toEntity()).toList();
      return result;
    } on HttpError catch (_) {
      throw DomainError.unexpected;
    }
  }

  @override
  Future<List<EventEntity>> getAllEventAsCreatorByUser({required String idUser}) async {
    try {
      List<EventEntity> result = [];
      final httpResponse = await client.get('eventos/quecriei/$idUser') as List;
      result = httpResponse.map((json) => EventModel.fromJson(json).toEntity()).toList();
      return result;
    } catch (e) {
      throw DomainError.unexpected;
    }
  }

  @override
  Future<List<EventEntity>> getAll({String? sort, String? filter}) async {
    try {
      List<EventEntity> result = [];
      final params = getParams('', null, null, sort, filter);
      final httpResponse = await client.get('Eventos/All$params') as List;
      result = httpResponse.map((json) => EventModel.fromJson(json).toEntity()).toList();
      return result;
    } catch (e) {
      throw DomainError.unexpected;
    }
  }

  String getParams(param, page, perPage, sort, filter) {
    if (page != null || perPage != null || sort != null || filter != null) {
      param = "?";
      if (page != null) {
        param += 'page=' + page;
      }
      if (perPage != null) {
        param += '&per_page=' + perPage;
      }
      if (sort != null) {
        param += '&sort=' + sort;
      }
      if (filter != null) {
        param += '&filter=' + filter;
      }
    }
    return param ?? "";
  }
}
