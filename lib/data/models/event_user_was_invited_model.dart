import 'package:bstage2/data/data.dart';

import '../../domain/helpers/enums.dart';

class EventUserWasInvitedModel {
  final String invitedBy;
  final DateTime when;
  final String idInvite;
  final EventModel event;

  EventUserWasInvitedModel({
    required this.invitedBy,
    required this.when,
    required this.idInvite,
    required this.event,
  });

  factory EventUserWasInvitedModel.fromJson(Map json) {
    return EventUserWasInvitedModel(
      invitedBy: json['ConvidadoPor'],
      when: DateTime.parse(json['Quando']),
      idInvite: json['IdConvite'],
      event: EventModel.fromJsonTemp(json),
    );
  }

  Map<String, dynamic> toJson() => {
        'ConvidadoPor': invitedBy,
        'Quando': when.toIso8601String(),
        'IdConvite': idInvite,
        'IdEvento': event.id,
        'Register': event.register.toIso8601String(),
        'Ativo': event.isActive,
        'Nome': event.name,
        'Descricao': event.description,
        'Destaque': event.highlightedUntil?.toIso8601String(),
        'Inicio': event.start.toIso8601String(),
        'Fim': event.end.toIso8601String(),
        'Telefone': event.contactPhone,
        'Endereco': event.address,
        'IdCriador': event.idCreator,
        'IdCategoria': event.idCategory,
        'DescricaoPromotor': event.promoterDescription,
        'Imagem': event.image,
        'IdadeMinima': event.minimumAge,
        'Tipo': event.eventType.description,
      };
}
