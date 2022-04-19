import 'package:bstage2/domain/helpers/helpers.dart';

abstract class ICreateEventUsecase {
  Future<bool> call(CreateEventParams param);
}
