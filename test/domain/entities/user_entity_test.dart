import 'package:bstage2/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

import '../user_entity_factory.dart';

main() {
  late UserEntity user;

  test('user.props', () {
    user = UserEntityFactory.makeNewUserEntity();

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
      user.phone,
      user.premiumUntil,
      user.picture,
      user.notifications,
      user.instagram,
      user.twitter,
      user.facebook,
    ]);
  });
}
