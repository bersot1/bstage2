import 'package:shared_preferences/shared_preferences.dart';

abstract class ICacheStorage {
  Future<SharedPreferences> get sharedPreferences;
  Future<dynamic> get(String key);
  Future<void> delete(String key);
  Future<void> save({required String key, required dynamic value});
  Future<void> clear();
}
