import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const _keyUser = 'user';
  static const _keyPass = 'pass';

  Future<void> saveCredentials(String user, String pass) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUser, user);
    await prefs.setString(_keyPass, pass);
  }

  Future<Map<String, String>?> getCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString(_keyUser);
    final pass = prefs.getString(_keyPass);
    if (user != null && pass != null) {
      return {'user': user, 'pass': pass};
    }
    return null;
  }

  Future<void> clearCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUser);
    await prefs.remove(_keyPass);
  }
}