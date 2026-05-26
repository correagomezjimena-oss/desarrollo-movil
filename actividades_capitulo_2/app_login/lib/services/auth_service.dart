import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthService {
  static const String _usersKey = 'registered_users';
  static const String _sessionKey = 'current_session';

  static String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    return sha256.convert(bytes).toString();
  }

  Future<String?> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final users = await _loadUsers(prefs);

    final exists = users.any(
      (u) => u.email == email.trim().toLowerCase(),
    );

    if (exists) {
      return 'El correo ya está registrado.';
    }

    final newUser = UserModel(
      name: name.trim(),
      email: email.trim().toLowerCase(),
      passwordHash: _hashPassword(password),
      createdAt: DateTime.now(),
    );

    users.add(newUser);

    await _saveUsers(prefs, users);

    return null;
  }

  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final users = await _loadUsers(prefs);

    try {
      final user = users.firstWhere(
        (u) =>
            u.email == email.trim().toLowerCase() &&
            u.passwordHash == _hashPassword(password),
      );

      await prefs.setString(
        _sessionKey,
        user.encode(),
      );

      return user;
    } catch (_) {
      return null;
    }
  }

  Future<UserModel?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = prefs.getString(_sessionKey);

    if (jsonString == null) {
      return null;
    }

    return UserModel.decode(jsonString);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_sessionKey);
  }

  Future<List<UserModel>> _loadUsers(
    SharedPreferences prefs,
  ) async {
    final raw = prefs.getStringList(_usersKey) ?? [];

    return raw
        .map((e) => UserModel.decode(e))
        .toList();
  }

  Future<void> _saveUsers(
    SharedPreferences prefs,
    List<UserModel> users,
  ) async {
    final raw = users
        .map((u) => u.encode())
        .toList();

    await prefs.setStringList(_usersKey, raw);
  }
}