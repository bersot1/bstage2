import 'package:bstage2/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

import '../params_factory.dart';

void main() {
  late CreateAccountParams createAccountParams;
  late CreateEventParams createEventeparams;

  test('CreateAccountParams.prop', () {
    createAccountParams = ParamsFactory.makeCreateAccountParams();

    expect(createAccountParams.props, [
      createAccountParams.name,
      createAccountParams.lastName,
      createAccountParams.email,
      createAccountParams.phone,
      createAccountParams.picture,
      createAccountParams.instagram,
      createAccountParams.twitter,
      createAccountParams.facebook,
    ]);
  });

  test('createEventParams.prop', () {
    createEventeparams = ParamsFactory.makeCreateEventParams();

    expect(createEventeparams.props, [
      createEventeparams.name,
      createEventeparams.description,
      createEventeparams.highlightedUntil,
      createEventeparams.start,
      createEventeparams.end,
      createEventeparams.contactPhone,
      createEventeparams.address,
      createEventeparams.idCreator,
      createEventeparams.idCategory,
      createEventeparams.promoterDescription,
      createEventeparams.image,
      createEventeparams.minimumAge,
      createEventeparams.eventType
    ]);
  });
}
