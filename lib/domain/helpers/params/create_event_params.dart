import 'dart:io';

import 'package:equatable/equatable.dart';

class CreateEventParams extends Equatable {
  final String name;
  final String description;
  final DateTime? highlightedUntil;
  final DateTime start;
  final DateTime end;
  final String contactPhone;
  final String address;
  final String idCreator;
  final String idCategory;
  final String? promoterDescription;
  final File image;
  final int minimumAge;
  final int eventType;

  const CreateEventParams({
    required this.name,
    required this.description,
    this.highlightedUntil,
    required this.start,
    required this.end,
    required this.contactPhone,
    required this.address,
    required this.idCreator,
    required this.idCategory,
    this.promoterDescription,
    required this.image,
    required this.minimumAge,
    required this.eventType,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        highlightedUntil,
        start,
        end,
        contactPhone,
        address,
        idCreator,
        idCategory,
        promoterDescription,
        image,
        minimumAge,
        eventType
      ];

  Map toJson() => {
        "nome": name,
        "descricao": description,
        "destaque": highlightedUntil,
        "inicio": start,
        "fim": end,
        "telefone": contactPhone,
        "endereco": address,
        "idCriador": idCreator,
        "idCategoria": idCategory,
        "descricaoPromotor": promoterDescription,
        "idadeMinima": minimumAge,
        "tipo": eventType
      };
}
