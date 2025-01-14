import 'package:breathin_app/Models/user_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Map<String, String>> userList = <Map<String, String>>[].obs;

  // Fetch users from Firestore and update the userList
  Future<void> fetchUsers() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('users').get();

      List<UserModel> users = snapshot.docs.map((doc) {
        return UserModel.fromMap(doc.data());
      }).toList();

      userList.clear();

      for (var user in users) {
        userList.add({
          'userId': user.userId,
          'username': user.username,
          'email': user.email,
          'language': user.language ?? '',
          'createdAt': user.createdAt?.toString() ?? '',
        });
      }
    } catch (e) {
      debugPrint('Error fetching users: $e');
    }
  }
}
