import 'package:flutter_101/202/cache/shared_not_initiliaze.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { key, users }

class SharedManager {
  SharedPreferences? preferences;

  SharedManager();

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _checkPreferences() {
    if (preferences == null) {
      throw SharedNotInitiliazeException();
    }
  }

  Future<void> saveString(SharedKeys key, String value) async {
    _checkPreferences();
    await preferences?.setString(key.name, value);
  }

  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    _checkPreferences();
    await preferences?.setStringList(key.name, value);
  }

  String? getString(SharedKeys key) {
    _checkPreferences();

    return preferences?.getString(key.name);
  }

  List<String>? getStringList(SharedKeys key) {
    _checkPreferences();

    return preferences?.getStringList(key.name);
  }

  Future<bool?> removeItem(SharedKeys key) async {
    _checkPreferences();

    return (await preferences?.remove(key.name)) ?? false;
  }
}
