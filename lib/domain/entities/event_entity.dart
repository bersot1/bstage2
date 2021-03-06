import 'package:equatable/equatable.dart';

import '../../domain/domain.dart';

class EventEntity extends Equatable {
  final String id;
  final DateTime register;
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

  const EventEntity({
    required this.id,
    required this.isActive,
    required this.register,
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
        id,
        isActive,
        register,
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
}
