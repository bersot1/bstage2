import 'dart:io';

import 'package:bstage2/domain/domain.dart';
import 'package:faker/faker.dart';

class ParamsFactory {
  static CreateEventParams makeCreateEventParams() => CreateEventParams(
        name: faker.lorem.word(),
        description: faker.lorem.sentence(),
        highlightedUntil: faker.date.dateTime(),
        start: faker.date.dateTime(),
        end: faker.date.dateTime(),
        contactPhone: faker.phoneNumber.us(),
        address: faker.address.city(),
        idCreator: faker.guid.guid(),
        idCategory: faker.guid.guid(),
        promoterDescription: faker.lorem.sentence(),
        image: File('lib/ui/assets/icon/favicon.png'),
        minimumAge: faker.randomGenerator.integer(70),
        eventType: 1,
      );

  static CreateAccountParams makeCreateAccountParams() => CreateAccountParams(
        name: faker.person.firstName(),
        lastName: faker.person.lastName(),
        email: faker.internet.email(),
        phone: faker.phoneNumber.us(),
        picture: faker.image.image(),
      );
}
