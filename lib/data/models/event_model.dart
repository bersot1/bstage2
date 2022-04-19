import '../../domain/domain.dart';

class EventModel {
  final String id;
  final bool isActive;
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
  final String image;
  final int minimumAge;
  final enumEventType eventType;

  const EventModel({
    required this.id,
    required this.isActive,
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

  factory EventModel.fromJson(Map json) {
    return EventModel(
      id: json['id'],
      isActive: json['ativo'],
      name: json['nome'],
      description: json['descricao'] ?? '',
      highlightedUntil: DateTime.parse(json['destaque']),
      start: DateTime.parse(json['inicio']),
      end: DateTime.parse(json['fim']),
      contactPhone: json['telefone'],
      address: json['endereco'],
      idCreator: json['idCriador'],
      idCategory: json['idCategoria'],
      promoterDescription: json['descricaoPromotor'],
      image: json['imagem'],
      minimumAge: json['idadeMinima'],
      eventType: json['tipo'] == 'Publico' ? enumEventType.public : enumEventType.private,
    );
  }

  EventEntity toEntity() => EventEntity(
        id: id,
        isActive: isActive,
        name: name,
        description: description,
        start: start,
        end: end,
        contactPhone: contactPhone,
        address: address,
        idCreator: idCreator,
        idCategory: idCategory,
        image: image,
        minimumAge: minimumAge,
        eventType: eventType,
        highlightedUntil: highlightedUntil,
        promoterDescription: promoterDescription,
      );
}
