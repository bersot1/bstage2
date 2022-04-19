import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final DateTime register;
  final bool active;
  final String name;
  final String lastName;
  final String? nickname;
  final String email;
  final String idFacebook;
  final DateTime? birthDate;
  final String? gender;
  final String? phone;
  final DateTime? premiumUntil;
  final String picture;
  final int? notifications;
  final String? instagram;
  final String? twitter;
  final String? facebook;

  const UserEntity({
    required this.id,
    required this.register,
    required this.active,
    required this.name,
    required this.lastName,
    this.nickname,
    required this.email,
    required this.idFacebook,
    this.birthDate,
    this.gender,
    this.phone,
    this.premiumUntil,
    required this.picture,
    this.notifications,
    this.instagram,
    this.twitter,
    this.facebook,
  });

  @override
  List<Object?> get props => [
        id,
        register,
        active,
        name,
        lastName,
        nickname,
        email,
        idFacebook,
        birthDate,
        gender,
        phone,
        premiumUntil,
        picture,
        notifications,
        instagram,
        twitter,
        facebook,
      ];
}
