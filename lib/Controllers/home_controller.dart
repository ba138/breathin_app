import 'package:breathin_app/Models/user_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<UserModel> userList = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('users').get();

      final users = snapshot.docs.map((doc) {
        return UserModel.fromMap(doc.data());
      }).toList();

      userList.assignAll(users);
    } catch (e) {
      debugPrint('Error fetching users: $e');
    }
  }
}
