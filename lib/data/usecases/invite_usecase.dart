import '../../data/data.dart';
import '../../domain/domain.dart';

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
