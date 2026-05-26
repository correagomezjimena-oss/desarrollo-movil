import 'dart:convert';

class UserModel {
  final String name;
  final String email;
  final String passwordHash;
  final DateTime createdAt;

  const UserModel({
    required this.name,
    required this.email,
    required this.passwordHash,
    required this.createdAt,
  });

  // Convertir objeto a Map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'passwordHash': passwordHash,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Convertir Map a objeto
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      passwordHash: json['passwordHash'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  // Convertir objeto a String JSON
  String encode() => jsonEncode(toJson());

  // Convertir String JSON a objeto
  factory UserModel.decode(String source) =>
      UserModel.fromJson(
        jsonDecode(source),
      );
}