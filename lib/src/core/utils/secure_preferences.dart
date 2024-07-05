import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurePreferences {
  static const secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static Future<void> saveEmail(String email) async {
    await secureStorage.write(key: emailKey, value: email);
  }

  static Future<void> savePassword(String password) async {
    await secureStorage.write(key: passwordKey, value: password);
  }

  static Future<void> saveUsername(String username) async {
    await secureStorage.write(key: usernameKey, value: username);
  }

  static Future<String?> getEmail() async {
    return await secureStorage.read(key: emailKey);
  }

  static Future<String?> getPassword() async {
    return await secureStorage.read(key: passwordKey);
  }
}

const String emailKey = 'email_key';
const String passwordKey = 'password_key';
const String usernameKey = 'username_key';
