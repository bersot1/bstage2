import 'package:bstage2/data/http/http_error.dart';
import 'package:bstage2/data/usecases/user/login_with_facebook_usecase.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/domain/helpers/params/result_login_social_param.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../domain/user_entity_factory.dart';
import '../../mocks/fb_package_client_spy.dart';

void main() {
  late LoginWithFacebookUsecase sut;
  late FbPackageSpy fbPackage;
  late Map<String, dynamic>? getUserDataResult;

  setUp(() {
    getUserDataResult = UserEntityFactory.makeNewUserDataFB();
    fbPackage = FbPackageSpy();
    fbPackage.mockLogin(true);
    fbPackage.mockGetUserData(getUserDataResult);
    sut = LoginWithFacebookUsecase(fbPackage);
  });
  test('Should return UserEntity when login returns true and getUserData return != null', () async {
    final response = await sut.call();

    expect(response, isA<ResultLoginSocial>());
  });
  test('Should return null when login returns true and getUserData return null', () async {
    fbPackage.mockGetUserData(null);
    final response = await sut.call();
    expect(response, null);
  });
  test('Should return null when login returns false', () async {
    fbPackage.mockLogin(false);
    final response = await sut.call();
    expect(response, null);
  });

  test('Should return DomainError unexpected when throws', () async {
    fbPackage.mockLoginError(HttpError.badRequest);
    final response = sut.call();
    expect(response, throwsA(DomainError.unexpected));
  });
}
