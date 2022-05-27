import 'package:equatable/equatable.dart';

class InfoGuestEventModel extends Equatable {
  final String id;
  final String name;
  final String instagram;
  final String picture;
  final String email;
  final int status;

  const InfoGuestEventModel({
    required this.id,
    required this.name,
    required this.instagram,
    required this.picture,
    required this.email,
    required this.status,
  });

  factory InfoGuestEventModel.fromJson(Map json) {
    return InfoGuestEventModel(
      id: json['id'],
      name: json['nome'],
      instagram: json['instagran'],
      picture: json['foto'],
      email: json['email'],
      status: json['status'],
    );
  }

  Map toJson() => {
        "id": id,
        "nome": name,
        "instagran": instagram,
        "foto": picture,
        "email": email,
        "status": status,
      };

  @override
  List<Object?> get props => [id, name, instagram, picture, email, status];
}
