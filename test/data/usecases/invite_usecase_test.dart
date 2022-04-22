import 'package:bstage2/data/http/http_error.dart';
import 'package:bstage2/data/models/event_user_was_invited_model.dart';
import 'package:bstage2/data/usecases/invite_usecase.dart';
import 'package:bstage2/domain/helpers/helpers.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/factory/event_user_was_invited_model_factory.dart';
import '../spys/http_client_spy.dart';

void main() {
  late InviteUsecase sut;
  late HttpClientSpy httpClient;
  late String idUser;
  late List<Map<String, dynamic>> apiResult;

  setUp(() {
    httpClient = HttpClientSpy();
    sut = InviteUsecase(httpClient);
    idUser = faker.guid.guid();
    apiResult = EventUserWasInvitedModelFactory.makeListMapEventUserWasInvitedModel();
    httpClient.mockRequestGet(apiResult);
  });

  group('getEventsThatUserWasInvitedToBePromoter - ', () {
    test('Should call httpClient with correct values', () async {
      await sut.getEventsThatUserWasInvitedToBePromoter(idUser);

      verify(() => httpClient.get("Eventos/withPendenciesFromProdutorToPromotersTobePromoters/perfil/$idUser"));
    });

    test('Should return List<EventUserWasInvitedModel> when https returns 200', () async {
      final result = await sut.getEventsThatUserWasInvitedToBePromoter(idUser);

      expect(result, isA<List<EventUserWasInvitedModel>>());
    });

    test('Should return DomainError.unexpected when https throws', () async {
      httpClient.mockRequestGetError(HttpError.serverError);
      final result = sut.getEventsThatUserWasInvitedToBePromoter(idUser);

      expect(result, throwsA(DomainError.unexpected));
    });
  });

  group('getEventsThatUserWasInvitedToGo - ', () {
    test('Should call httpClient with correct values', () async {
      await sut.getEventsThatUserWasInvitedToGo(idUser);

      verify(() => httpClient.get("Eventos/QueFuiConvidado/$idUser"));
    });

    test('Should return List<EventUserWasInvitedModel> when https returns 200', () async {
      final result = await sut.getEventsThatUserWasInvitedToGo(idUser);

      expect(result, isA<List<EventUserWasInvitedModel>>());
    });

    test('Should return DomainError.unexpected when https throws', () async {
      httpClient.mockRequestGetError(HttpError.serverError);
      final result = sut.getEventsThatUserWasInvitedToBePromoter(idUser);

      expect(result, throwsA(DomainError.unexpected));
    });
  });
}
