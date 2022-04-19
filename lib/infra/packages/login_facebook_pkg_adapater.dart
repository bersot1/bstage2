import 'package:bstage2/data/data.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginFacebookPkgAdapter implements IFacebookPackage {
  @override
  Future<Map<String, dynamic>?> getUserData() async {
    try {
      return await FacebookAuth.instance.getUserData();
    } catch (e) {
      throw HttpError.badRequest;
    }
  }

  @override
  Future<bool> login() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        return true;
      }

      return false;
    } catch (e) {
      throw HttpError.badRequest;
    }
  }
}
