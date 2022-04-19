abstract class IFacebookPackage {
  Future<bool> login();
  Future<Map<String, dynamic>?> getUserData();
}
