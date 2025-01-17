



import 'package:shared_preferences/shared_preferences.dart';

class StorageService{
  late final SharedPreferences _preferences;

  Future<StorageService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }


}