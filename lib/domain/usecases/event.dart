import 'package:bstage2/domain/domain.dart';

abstract class IEventUsecases {
  Future<bool> create(CreateEventParams param);
  Future<List<EventEntity>> getPremiums();
  Future<List<EventEntity>> getPublics({required String page, String perPage});
}
