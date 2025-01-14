import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Utills/app_theme.dart';
import 'Views/LoginView/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: LoginView(),
    );
  }
}
