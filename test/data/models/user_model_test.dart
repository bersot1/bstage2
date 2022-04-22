import 'package:bstage2/data/data.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../domain/factory/user_entity_factory.dart';

main() {
  late UserModel user;

  test('user.props', () {
    user = UserEntityFactory.makeUserModel();

    expect(user.props, [
      user.id,
      user.register,
      user.active,
      user.name,
      user.lastName,
      user.nickname,
      user.email,
      user.idFacebook,
      user.birthDate,
      user.gender,
      user.premiumUntil,
      user.phone,
      user.picture,
      user.notifications,
      user.instagram,
      user.facebook,
      user.twitter,
    ]);
  });
}
