import 'dart:io';

import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/domain/helpers/params/result_login_social_param.dart';
import 'package:faker/faker.dart';

class ParamsFactory {
  static CreateEventParams makeCreateEventParams() => CreateEventParams(
        eventType: 1,
        address: faker.address.city(),
        contactPhone: faker.phoneNumber.us(),
        description: faker.lorem.sentences(20).toString(),
        end: faker.date.dateTime(),
        idCategory: faker.guid.guid(),
        idCreator: faker.guid.guid(),
        image: File('lib/ui/assets/icon/favicon.png'),
        minimumAge: faker.randomGenerator.integer(70),
        name: faker.lorem.word(),
        start: faker.date.dateTime(),
        highlightedUntil: faker.date.dateTime(),
        promoterDescription: faker.lorem.word(),
      );

  static CreateAccountParams makeCreateAccountParams() => CreateAccountParams(
        name: faker.person.name(),
        lastName: faker.person.lastName(),
        email: "${faker.person.name()}@gmail.com",
        phone: faker.phoneNumber.us(),
        picture: faker.image.image(),
        facebook: faker.randomGenerator.numbers(9, 10).toString(),
        instagram: faker.lorem.word(),
        twitter: faker.lorem.word(),
      );

  static ResultLoginSocial makeResultLoginSocial() => ResultLoginSocial(
        name: faker.person.name(),
        email: faker.internet.email(),
        idFacebook: faker.guid.guid(),
        picture: faker.image.image(),
      );
}
