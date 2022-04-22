import 'package:bstage2/data/data.dart';
import 'package:bstage2/data/models/event_user_was_invited_model.dart';
import 'package:bstage2/domain/helpers/helpers.dart';
import 'package:bstage2/domain/usecases/invites.dart';

class InviteUsecase implements IInvitesUsecase {
  final IHttpClient httpClient;

  InviteUsecase(this.httpClient);

  @override
  Future<List<EventUserWasInvitedModel>> getEventsThatUserWasInvitedToBePromoter(String idUser) async {
    try {
      final httpResponse =
          await httpClient.get("Eventos/withPendenciesFromProdutorToPromotersTobePromoters/perfil/$idUser") as List;
      return httpResponse.map((json) => EventUserWasInvitedModel.fromJson(json)).toList();
    } catch (_) {
      throw DomainError.unexpected;
    }
  }

  @override
  Future<List<EventUserWasInvitedModel>> getEventsThatUserWasInvitedToGo(String idUser) async {
    try {
      final httpResponse = await httpClient.get("Eventos/QueFuiConvidado/$idUser") as List;
      return httpResponse.map((json) => EventUserWasInvitedModel.fromJson(json)).toList();
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
