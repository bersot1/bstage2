import '../../domain/domain.dart';

abstract class IEventUsecases {
  Future<bool> create(CreateEventParams param);
  Future<List<EventEntity>> getPremiums();
  Future<List<EventEntity>> getPublics({required String page, String perPage});
  Future<List<EventEntity>> getAllEventAsCreatorByUser({required String idUser});
  Future<List<EventEntity>> getAllEventAsPromoterByUser({required String idUser});
  Future<List<EventEntity>> getAll({String? sort, String? filter});
}
