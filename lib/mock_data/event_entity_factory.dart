import 'package:bstage2/data/data.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/ui/pages/home/components/bstage_category_name.dart';
import 'package:faker/faker.dart';

class EventsFactory {
  static EventEntity makeEventEntity() {
    return EventEntity(
      id: faker.guid.guid(),
      register: faker.date.dateTime(minYear: 2022, maxYear: 2025),
      isActive: true,
      name: faker.lorem.word(),
      description: faker.lorem.sentence(),
      highlightedUntil: faker.date.dateTime(minYear: 2022, maxYear: 2025),
      start: faker.date.dateTime(minYear: 2022, maxYear: 2025),
      end: faker.date.dateTime(minYear: 2022, maxYear: 2025),
      contactPhone: faker.phoneNumber.us(),
      address: faker.address.city(),
      idCreator: faker.guid.guid(),
      idCategory: BstageCategoryName.getRandomCategoryId(),
      promoterDescription: faker.lorem.sentence(),
      image: faker.image.image(random: true),
      minimumAge: faker.randomGenerator.integer(70),
      eventType: enumEventType.public,
    );
  }

  static EventModel makeEventModel() {
    return EventModel(
      id: faker.guid.guid(),
      register: faker.date.dateTime(minYear: 2022, maxYear: 2025),
      isActive: true,
      name: faker.lorem.word(),
      description: faker.lorem.sentence(),
      highlightedUntil: faker.date.dateTime(minYear: 2022, maxYear: 2025),
      start: faker.date.dateTime(minYear: 2022, maxYear: 2025),
      end: faker.date.dateTime(minYear: 2022, maxYear: 2025),
      contactPhone: faker.phoneNumber.us(),
      address: faker.address.city(),
      idCreator: faker.guid.guid(),
      idCategory: BstageCategoryName.getRandomCategoryId(),
      promoterDescription: faker.lorem.sentence(),
      image: faker.image.image(random: true),
      minimumAge: faker.randomGenerator.integer(70),
      eventType: enumEventType.public,
    );
  }

  static List<Map> makeListPublicEvent() {
    return [
      {
        "id": faker.guid.guid(),
        "register": faker.date.dateTime(minYear: 2022, maxYear: 2025).toIso8601String(),
        "ativo": true,
        "nome": faker.lorem.word(),
        "descricao": faker.lorem.sentence(),
        "destaque": null,
        "inicio": faker.date.dateTime(minYear: 2022, maxYear: 2025).toIso8601String(),
        "fim": faker.date.dateTime(minYear: 2022, maxYear: 2025).toIso8601String(),
        "telefone": faker.phoneNumber.us(),
        "endereco": faker.address.city(),
        "idCriador": faker.guid.guid(),
        "idCategoria": faker.guid.guid(),
        "descricaoPromotor": faker.lorem.sentence(),
        "imagem": faker.image.image(random: true),
        "idadeMinima": faker.randomGenerator.integer(70),
        "tipo": 'Publico'
      },
      {
        "id": faker.guid.guid(),
        "ativo": true,
        "register": faker.date.dateTime(minYear: 2022, maxYear: 2025).toIso8601String(),
        "nome": faker.lorem.word(),
        "descricao": faker.lorem.sentence(),
        "destaque": faker.date.dateTime(minYear: 2022, maxYear: 2025).toIso8601String(),
        "inicio": faker.date.dateTime(minYear: 2022, maxYear: 2025).toIso8601String(),
        "fim": faker.date.dateTime(minYear: 2022, maxYear: 2025).toIso8601String(),
        "telefone": faker.phoneNumber.us(),
        "endereco": faker.address.city(),
        "idCriador": faker.guid.guid(),
        "idCategoria": faker.guid.guid(),
        "descricaoPromotor": faker.lorem.sentence(),
        "imagem": faker.image.image(random: true),
        "idadeMinima": faker.randomGenerator.integer(70),
        "tipo": 'Publico'
      },
      {
        "id": faker.guid.guid(),
        "ativo": true,
        "register": faker.date.dateTime(minYear: 2022, maxYear: 2025).toIso8601String(),
        "nome": faker.lorem.word(),
        "descricao": faker.lorem.sentence(),
        "destaque": faker.date.dateTime(minYear: 2022, maxYear: 2025).toIso8601String(),
        "inicio": faker.date.dateTime(minYear: 2022, maxYear: 2025).toIso8601String(),
        "fim": faker.date.dateTime(minYear: 2022, maxYear: 2025).toIso8601String(),
        "telefone": faker.phoneNumber.us(),
        "endereco": faker.address.city(),
        "idCriador": faker.guid.guid(),
        "idCategoria": faker.guid.guid(),
        "descricaoPromotor": faker.lorem.sentence(),
        "imagem": faker.image.image(random: true),
        "idadeMinima": faker.randomGenerator.integer(70),
        "tipo": 'Publico'
      },
      {
        "id": faker.guid.guid(),
        "ativo": true,
        "register": faker.date.dateTime(minYear: 2022, maxYear: 2025).toIso8601String(),
        "nome": faker.lorem.word(),
        "descricao": faker.lorem.sentence(),
        "destaque": faker.date.dateTime(minYear: 2022, maxYear: 2025).toIso8601String(),
        "inicio": faker.date.dateTime(minYear: 2022, maxYear: 2025).toIso8601String(),
        "fim": faker.date.dateTime(minYear: 2022, maxYear: 2025).toIso8601String(),
        "telefone": faker.phoneNumber.us(),
        "endereco": faker.address.city(),
        "idCriador": faker.guid.guid(),
        "idCategoria": faker.guid.guid(),
        "descricaoPromotor": faker.lorem.sentence(),
        "imagem": faker.image.image(random: true),
        "idadeMinima": faker.randomGenerator.integer(70),
        "tipo": 'Publico'
      },
      {
        "id": faker.guid.guid(),
        "ativo": true,
        "register": faker.date.dateTime(minYear: 2022, maxYear: 2025).toIso8601String(),
        "nome": faker.lorem.word(),
        "descricao": faker.lorem.sentence(),
        "destaque": faker.date.dateTime(minYear: 2022, maxYear: 2025).toIso8601String(),
        "inicio": faker.date.dateTime(minYear: 2022, maxYear: 2025).toIso8601String(),
        "fim": faker.date.dateTime(minYear: 2022, maxYear: 2025).toIso8601String(),
        "telefone": faker.phoneNumber.us(),
        "endereco": faker.address.city(),
        "idCriador": faker.guid.guid(),
        "idCategoria": faker.guid.guid(),
        "descricaoPromotor": faker.lorem.sentence(),
        "imagem": faker.image.image(random: true),
        "idadeMinima": faker.randomGenerator.integer(70),
        "tipo": 'Publico'
      },
    ];
  }
}
