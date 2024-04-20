import 'package:get_storage/get_storage.dart';

class SLocalStorage {
  static final SLocalStorage _instance = SLocalStorage._internal();

  factory SLocalStorage() => _instance;

  SLocalStorage._internal();

  final _storage = GetStorage();

  Future<void> saveData<S>(String key, S value) async {
    await _storage.write(key, value);
  }

  S? readData<S>(String key) {
    return _storage.read<S>(key);
  }

  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  Future<void> clearAll() async {
    await _storage.erase();
  }
}
