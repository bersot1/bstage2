import 'package:bstage2/domain/domain.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
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

  const UserModel({
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

  factory UserModel.fromJson(Map json) {
    return UserModel(
      id: json['id'],
      register: DateTime.parse(json['register']),
      active: json['ativo'],
      name: json['nome'],
      lastName: json['sobrenome'],
      nickname: json['nick'],
      email: json['email'],
      idFacebook: json['idFacebook'],
      birthDate: json['dataDeNascimento'] == null ? null : DateTime.parse(json['dataDeNascimento']),
      gender: json['sexo'].toString(),
      premiumUntil: json['premium'] == null ? null : DateTime.parse(json['premium']),
      picture: json['foto'],
      phone: json['celular'],
      notifications: json['notificacoes'],
      instagram: json['instagran'],
      facebook: json['facebook'],
      twitter: json['twitter'],
    );
  }

  factory UserModel.fromUserEntity(UserEntity user) {
    return UserModel(
      id: user.id,
      register: user.register,
      active: user.active,
      name: user.name,
      lastName: user.lastName,
      nickname: user.nickname,
      email: user.email,
      idFacebook: user.idFacebook,
      birthDate: user.birthDate,
      gender: user.gender,
      premiumUntil: user.premiumUntil,
      phone: user.phone,
      picture: user.picture,
      notifications: user.notifications,
      instagram: user.instagram,
      facebook: user.facebook,
      twitter: user.twitter,
    );
  }

  UserEntity toEntity() => UserEntity(
        id: id,
        register: register,
        active: active,
        name: name,
        lastName: lastName,
        nickname: nickname,
        email: email,
        idFacebook: idFacebook,
        birthDate: birthDate,
        gender: gender,
        premiumUntil: premiumUntil,
        phone: phone,
        picture: picture,
        notifications: notifications,
        instagram: instagram,
        facebook: facebook,
        twitter: twitter,
      );

  Map toJson() => {
        "id": id,
        "register": register.toIso8601String(),
        "active": active,
        "name": name,
        "lastName": lastName,
        "nickname": nickname,
        "email": email,
        "idFacebook": idFacebook,
        "birthDate": birthDate?.toIso8601String(),
        "gender": gender,
        "phone": phone,
        "premiumUntil": premiumUntil?.toIso8601String(),
        "picture": picture,
        "notifications": notifications,
        "instagram": instagram,
        "twitter": twitter,
        "facebook": facebook,
      };

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
        premiumUntil,
        phone,
        picture,
        notifications,
        instagram,
        facebook,
        twitter,
      ];
}
