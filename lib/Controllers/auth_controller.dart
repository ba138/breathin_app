import 'package:breathin_app/Models/user_models.dart';
import 'package:breathin_app/Views/LanguageSelectionView/language_selection_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxBool isLoading = false.obs;

  Future<void> signupUser({
    required String username,
    required String email,
    required String password,
    required GlobalKey<FormState> formKey,
  }) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading.value = true;

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        await user.sendEmailVerification();

        await _firestore.collection('users').doc(user.uid).set(
              UserModel(
                userId: user.uid,
                username: username,
                email: email,
                createdAt: DateTime.now(),
              ).toMap(),
            );

        Get.snackbar(
          'Verification Email Sent',
          'A verification email has been sent to $email. Please verify your email before logging in.',
          snackPosition: SnackPosition.TOP,
        );

        Get.back();
      } else {
        Get.snackbar(
          'Error',
          'Failed to retrieve user information.',
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      // Attempt to log in the user
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null && user.emailVerified) {
        Get.snackbar(
          'Login Successful',
          'Welcome back, ${user.email}!',
          snackPosition: SnackPosition.TOP,
        );

        Get.offAll(() => LanguageSelectionView());
      } else {
        Get.snackbar(
          'Email Not Verified',
          'Please verify your email to continue.',
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Login Failed',
        e.toString(),
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> checkEmailVerification() async {
    User? user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.reload();
      if (user.emailVerified) {
        Get.snackbar('Success', 'Email verified successfully!');
      } else {
        Get.snackbar('Warning', 'Please verify your email before continuing.');
      }
    }
  }
}