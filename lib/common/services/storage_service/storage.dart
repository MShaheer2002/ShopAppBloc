



import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_bloc_app/common/values/constant.dart';

class StorageService{
  late final SharedPreferences _preferences;

  Future<StorageService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  bool getDeviceFirstOpen() {
    return _preferences.getBool(Constant.STORAGE_DEVICE_FIRST_OPEN_KEY) ?? false;
  }

  bool getAlreadyLogedIn() {
    return _preferences.getBool(Constant.LOGED_IN) ?? false;
  }


}