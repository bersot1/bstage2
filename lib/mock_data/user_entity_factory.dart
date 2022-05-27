import 'package:bstage2/data/data.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/domain/helpers/params/result_login_social_param.dart';
import 'package:faker/faker.dart';

class UserEntityFactory {
  static List<Map> makeMapInfoGuestEventModel() => [
        InfoGuestEventModel(
          id: faker.guid.guid(),
          name: faker.person.firstName(),
          instagram: "@${faker.person.name()}",
          picture: faker.image.image(),
          email: faker.internet.email(),
          status: faker.randomGenerator.integer(2),
        ).toJson(),
        InfoGuestEventModel(
          id: faker.guid.guid(),
          name: faker.person.firstName(),
          instagram: "@${faker.person.name()}",
          picture: faker.image.image(),
          email: faker.internet.email(),
          status: faker.randomGenerator.integer(2),
        ).toJson(),
        InfoGuestEventModel(
          id: faker.guid.guid(),
          name: faker.person.firstName(),
          instagram: "@${faker.person.name()}",
          picture: faker.image.image(),
          email: faker.internet.email(),
          status: faker.randomGenerator.integer(2),
        ).toJson(),
        InfoGuestEventModel(
          id: faker.guid.guid(),
          name: faker.person.firstName(),
          instagram: "@${faker.person.name()}",
          picture: faker.image.image(),
          email: faker.internet.email(),
          status: faker.randomGenerator.integer(2),
        ).toJson(),
        InfoGuestEventModel(
          id: faker.guid.guid(),
          name: faker.person.firstName(),
          instagram: "@${faker.person.name()}",
          picture: faker.image.image(),
          email: faker.internet.email(),
          status: faker.randomGenerator.integer(2),
        ).toJson(),
      ];

  static List<InfoGuestEventModel> makeListInfoGuestEventModel() => [
        InfoGuestEventModel(
          id: faker.guid.guid(),
          name: faker.person.firstName(),
          instagram: "@${faker.person.name()}",
          picture: faker.image.image(),
          email: faker.internet.email(),
          status: faker.randomGenerator.integer(2),
        ),
        InfoGuestEventModel(
          id: faker.guid.guid(),
          name: faker.person.firstName(),
          instagram: "@${faker.person.name()}",
          picture: faker.image.image(),
          email: faker.internet.email(),
          status: faker.randomGenerator.integer(2),
        ),
        InfoGuestEventModel(
          id: faker.guid.guid(),
          name: faker.person.firstName(),
          instagram: "@${faker.person.name()}",
          picture: faker.image.image(),
          email: faker.internet.email(),
          status: faker.randomGenerator.integer(2),
        ),
      ];

  static UserEntity makeNewUserEntity() => UserEntity(
        id: faker.guid.guid(),
        register: faker.date.dateTime(),
        active: true,
        name: faker.person.firstName(),
        lastName: faker.person.lastName(),
        nickname: faker.lorem.word(),
        email: "${faker.person.name()}@gmail.com",
        idFacebook: faker.guid.guid(),
        birthDate: faker.date.dateTime(),
        gender: "Masculino",
        premiumUntil: faker.date.dateTime(),
        picture: faker.image.image(),
        phone: '12345678',
        notifications: null,
        instagram: faker.lorem.word(),
        facebook: faker.lorem.word(),
        twitter: faker.lorem.word(),
      );

  static Map makeNewUser() => {
        "id": faker.guid.guid(),
        "register": faker.date.dateTime().toIso8601String(),
        "ativo": true,
        "nome": faker.person.firstName(),
        "sobrenome": faker.person.lastName(),
        "nick": faker.lorem.word(),
        "email": "${faker.person.name()}@gmail.com",
        "idFacebook": faker.guid.guid(),
        "dataDeNascimento": faker.date.dateTime().toIso8601String(),
        "sexo": "Masculino",
        "premium": faker.date.dateTime().toIso8601String(),
        "foto": faker.image.image(),
        "celular": '12345678',
        "notificacoes": null,
        "instagran": faker.lorem.word(),
        "facebook": faker.lorem.word(),
        "twitter": faker.lorem.word(),
      };

  static Map<String, dynamic>? makeNewUserDataFB() => {
        "name": faker.person.name(),
        "email": faker.internet.email(),
        "picture": {
          "data": {"height": 300, "is_silhouette": false, "url": faker.image.image(), "width": 200}
        },
        "id": faker.guid.guid(),
      };

  static ResultLoginSocial makeResultLoginSocial() => ResultLoginSocial(
        name: faker.person.name(),
        email: faker.internet.email(),
        idFacebook: faker.guid.guid(),
        picture: faker.image.image(),
      );

  static UserModel makeUserModel() => UserModel(
        id: faker.guid.guid(),
        register: faker.date.dateTime(),
        active: true,
        name: faker.person.firstName(),
        lastName: faker.person.lastName(),
        nickname: faker.lorem.word(),
        email: "${faker.person.name()}@gmail.com",
        idFacebook: faker.guid.guid(),
        birthDate: faker.date.dateTime(),
        gender: "Masculino",
        premiumUntil: faker.date.dateTime(),
        picture: faker.image.image(),
        phone: '12345678',
        notifications: null,
        instagram: faker.lorem.word(),
        facebook: faker.lorem.word(),
        twitter: faker.lorem.word(),
      );
}
