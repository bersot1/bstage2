import 'package:bstage2/data/models/event_user_was_invited_model.dart';
import 'package:bstage2/data/usecases/invite_usecase.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/factory/event_user_was_invited_model_factory.dart';
import '../spys/http_client_spy.dart';

void main() {
  late InviteUsecase sut;
  late HttpClientSpy httpClient;
  late String idUser;

  setUp(() {
    httpClient = HttpClientSpy();
    sut = InviteUsecase(httpClient);
    idUser = faker.guid.guid();
  });

  group('getEventsThatUserWasInvitedToBePromoter - ', () {
    late List<Map<String, dynamic>> apiResult;
    setUp(() {
      apiResult = EventUserWasInvitedModelFactory.makeListMapEventUserWasInvitedModel();
      httpClient.mockRequestGet(apiResult);
    });
    test('Should call httpClient with correct values', () async {
      await sut.getEventsThatUserWasInvitedToBePromoter(idUser);

      verify(() => httpClient.get("Eventos/withPendenciesFromProdutorToPromotersTobePromoters/perfil/$idUser"));
    });

    test('Should return List<EventUserWasInvitedModel> when https returns 200', () async {
      final result = await sut.getEventsThatUserWasInvitedToBePromoter(idUser);

      expect(result, isA<List<EventUserWasInvitedModel>>());
    });
  });
}
