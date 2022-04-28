import 'package:shared_preferences/shared_preferences.dart';

import '../../data/data.dart';

class LocalCacheStorageAdapter implements ICacheStorage {
  @override
  Future<SharedPreferences> get sharedPreferences async => await SharedPreferences.getInstance();

  @override
  Future<void> delete(String key) async {
    final localStorage = await sharedPreferences;
    await localStorage.remove(key);
  }

  @override
  Future<dynamic> get(String key) async {
    final localStorage = await sharedPreferences;
    return localStorage.get(key);
  }

  @override
  Future<void> save({required String key, required value}) async {
    final localStorage = await sharedPreferences;
    await localStorage.setString(key, value);
  }

  @override
  Future<void> clear() async {
    final localStorage = await sharedPreferences;
    await localStorage.clear();
  }
}
