import 'package:bstage2/domain/entities/entities.dart';

abstract class IGetPublicEvent {
  Future<List<EventEntity>> call();
}
