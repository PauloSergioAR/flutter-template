import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart' as shared_pref;

import 'shared_preferences.dart';

class SharedHelper implements SharedPreferences {
  late Future<shared_pref.SharedPreferences> _prefs;

  SharedHelper() {
    _prefs = shared_pref.SharedPreferences.getInstance();
  }

  @override
  Future<void> setStorageData(String key, Object value) async =>
      (await _prefs).setString(key, jsonEncode(value));

  @override
  Future<void> setStorageInt(String key, int value) async =>
      (await _prefs).setInt(key, value);

  @override
  Future<void> setStorageBool(String key, bool value) async =>
      (await _prefs).setBool(key, value);

  @override
  Future<dynamic> getStorageData(String key) async {
    var data = (await _prefs).getString(key);

    return data != null ? jsonDecode(data) : null;
  }

  @override
  Future<int?> getStorageInt(String key) async => (await _prefs).getInt(key);

  @override
  Future<bool?> getStorageBool(String key) async => (await _prefs).getBool(key);

  @override
  Future<void> removeStorage(String key) async => (await _prefs).remove(key);
}
