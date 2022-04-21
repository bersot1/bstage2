import 'package:bstage2/data/data.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/domain/entities/event_entity.dart';
import 'package:bstage2/domain/helpers/params/create_event_params.dart';
import 'package:bstage2/domain/usecases/event.dart';

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
}
