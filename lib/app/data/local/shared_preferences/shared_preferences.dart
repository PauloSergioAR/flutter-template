abstract class SharedPreferences {
  Future<void> setStorageData(String key, Object value);

  Future<void> setStorageInt(String key, int value);

  Future<void> setStorageBool(String key, bool value);

  Future<dynamic> getStorageData(String key);

  Future<int?> getStorageInt(String key);

  Future<bool?> getStorageBool(String key);

  Future<void> removeStorage(String key);
}

class SharedKeys {
  static const String auth = 'auth';
  static const String user = 'user';
}
