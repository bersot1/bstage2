import 'package:equatable/equatable.dart';

class CreateAccountParams extends Equatable {
  final String name;
  final String lastName;
  final String email;
  final String? phone;
  final String picture;
  final String? instagram;
  final String? twitter;
  final String? facebook;

  const CreateAccountParams({
    required this.name,
    required this.lastName,
    required this.email,
    this.phone,
    required this.picture,
    this.instagram,
    this.twitter,
    this.facebook,
  });

  @override
  List<Object?> get props => [
        name,
        lastName,
        email,
        phone,
        picture,
        instagram,
        twitter,
        facebook,
      ];

  Map toJson() => {
        "nome": name,
        "sobrenome": lastName,
        "email": email,
        "celular": phone,
        "instagran": instagram,
        "twitter": twitter,
        "facebook": facebook,
        "imagem": picture,
      };
}
