import 'package:bstage2/data/data.dart';
import 'package:mocktail/mocktail.dart';

class FbPackageSpy extends Mock implements IFacebookPackage {
  When mockLoginCall() => when(() => login());
  void mockLogin(bool value) => mockLoginCall().thenAnswer((_) async => value);
  void mockLoginError(HttpError error) => mockLoginCall().thenThrow(error);

  When mockGetUserDataCall() => when(() => getUserData());
  void mockGetUserData(Map<String, dynamic>? value) => mockGetUserDataCall().thenAnswer((_) async => value);
  void mockGetUserDataError(HttpError error) => mockGetUserDataCall().thenThrow(error);
}
