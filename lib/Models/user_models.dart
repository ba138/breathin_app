import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userId;
  final String username;
  final String email;
  final String? language;
  final DateTime? createdAt;

  UserModel({
    required this.userId,
    required this.username,
    required this.email,
    this.language,
    this.createdAt,
  });

  factory UserModel.fromMap(
    Map<String, dynamic> data,
  ) {
    return UserModel(
      userId: data['userId'],
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      language: data['language'],
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
      'language': language,
      'createdAt': createdAt,
    };
  }
}
