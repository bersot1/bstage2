import 'package:bstage2/data/data.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:faker/faker.dart';

class EventsFactory {
  static EventEntity makeEventEntity() {
    return EventEntity(
      id: faker.guid.guid(),
      register: faker.date.dateTime(),
      isActive: true,
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
      image: faker.image.image(),
      minimumAge: faker.randomGenerator.integer(70),
      eventType: enumEventType.public,
    );
  }

  static EventModel makeEventModel() {
    return EventModel(
      id: faker.guid.guid(),
      register: faker.date.dateTime(),
      isActive: true,
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
      image: faker.image.image(),
      minimumAge: faker.randomGenerator.integer(70),
      eventType: enumEventType.public,
    );
  }

  static List<Map> makeListPublicEvent() {
    return [
      {
        "id": faker.guid.guid(),
        "register": faker.date.dateTime().toIso8601String(),
        "ativo": true,
        "nome": faker.lorem.word(),
        "descricao": faker.lorem.sentence(),
        "destaque": faker.date.dateTime().toIso8601String(),
        "inicio": faker.date.dateTime().toIso8601String(),
        "fim": faker.date.dateTime().toIso8601String(),
        "telefone": faker.phoneNumber.us(),
        "endereco": faker.address.city(),
        "idCriador": faker.guid.guid(),
        "idCategoria": faker.guid.guid(),
        "descricaoPromotor": faker.lorem.sentence(),
        "imagem": faker.image.image(),
        "idadeMinima": faker.randomGenerator.integer(70),
        "tipo": 'Publico'
      },
      {
        "id": faker.guid.guid(),
        "ativo": true,
        "register": faker.date.dateTime().toIso8601String(),
        "nome": faker.lorem.word(),
        "descricao": faker.lorem.sentence(),
        "destaque": faker.date.dateTime().toIso8601String(),
        "inicio": faker.date.dateTime().toIso8601String(),
        "fim": faker.date.dateTime().toIso8601String(),
        "telefone": faker.phoneNumber.us(),
        "endereco": faker.address.city(),
        "idCriador": faker.guid.guid(),
        "idCategoria": faker.guid.guid(),
        "descricaoPromotor": faker.lorem.sentence(),
        "imagem": faker.image.image(),
        "idadeMinima": faker.randomGenerator.integer(70),
        "tipo": 'Publico'
      },
      {
        "id": faker.guid.guid(),
        "ativo": true,
        "register": faker.date.dateTime().toIso8601String(),
        "nome": faker.lorem.word(),
        "descricao": faker.lorem.sentence(),
        "destaque": faker.date.dateTime().toIso8601String(),
        "inicio": faker.date.dateTime().toIso8601String(),
        "fim": faker.date.dateTime().toIso8601String(),
        "telefone": faker.phoneNumber.us(),
        "endereco": faker.address.city(),
        "idCriador": faker.guid.guid(),
        "idCategoria": faker.guid.guid(),
        "descricaoPromotor": faker.lorem.sentence(),
        "imagem": faker.image.image(),
        "idadeMinima": faker.randomGenerator.integer(70),
        "tipo": 'Publico'
      },
      {
        "id": faker.guid.guid(),
        "ativo": true,
        "register": faker.date.dateTime().toIso8601String(),
        "nome": faker.lorem.word(),
        "descricao": faker.lorem.sentence(),
        "destaque": faker.date.dateTime().toIso8601String(),
        "inicio": faker.date.dateTime().toIso8601String(),
        "fim": faker.date.dateTime().toIso8601String(),
        "telefone": faker.phoneNumber.us(),
        "endereco": faker.address.city(),
        "idCriador": faker.guid.guid(),
        "idCategoria": faker.guid.guid(),
        "descricaoPromotor": faker.lorem.sentence(),
        "imagem": faker.image.image(),
        "idadeMinima": faker.randomGenerator.integer(70),
        "tipo": 'Publico'
      },
      {
        "id": faker.guid.guid(),
        "ativo": true,
        "register": faker.date.dateTime().toIso8601String(),
        "nome": faker.lorem.word(),
        "descricao": faker.lorem.sentence(),
        "destaque": faker.date.dateTime().toIso8601String(),
        "inicio": faker.date.dateTime().toIso8601String(),
        "fim": faker.date.dateTime().toIso8601String(),
        "telefone": faker.phoneNumber.us(),
        "endereco": faker.address.city(),
        "idCriador": faker.guid.guid(),
        "idCategoria": faker.guid.guid(),
        "descricaoPromotor": faker.lorem.sentence(),
        "imagem": faker.image.image(),
        "idadeMinima": faker.randomGenerator.integer(70),
        "tipo": 'Publico'
      },
    ];
  }
}
