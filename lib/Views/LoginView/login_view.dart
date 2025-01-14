import 'dart:ui';

import 'package:breathin_app/Controllers/auth_controller.dart';
import 'package:breathin_app/Utills/Resources/colors.dart';
import 'package:breathin_app/Utills/Widgets/auth_provider_button.dart';
import 'package:breathin_app/Utills/Widgets/custom_button.dart';
import 'package:breathin_app/Utills/Widgets/custom_textfield.dart';
import 'package:breathin_app/Utills/Widgets/vertical_Speacing.dart';
import 'package:breathin_app/Views/SignupView/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final SignupController authController = Get.put(SignupController());

    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/yoga_girl.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    color: Colors.black.withValues(alpha: 0),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 40,
                    bottom: 20,
                  ),
                  child: Form(
                    key: _formKey, // Assign form key
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome to Breathin",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Raglika Font',
                          ),
                        ),
                        Text(
                          "Please enter your details to continue",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.whiteColor,
                          ),
                        ),
                        VerticalSpeacing(30),
                        // Email Field with validation
                        TextFieldCustom(
                          maxLines: 1,
                          title: "Email",
                          controller: emailController,
                          hintText: "example@gmail.com",
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }
                            // Basic email format validation
                            if (!RegExp(
                                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                .hasMatch(value)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                        VerticalSpeacing(8),
                        // Password Field with validation
                        TextFieldCustom(
                          maxLines: 1,
                          title: "Password",
                          controller: passwordController,
                          obscureText: true,
                          hintText: "must be 8 characters",
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },
                        ),
                        VerticalSpeacing(8),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "Forget Password",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColor.blackColor,
                            ),
                          ),
                        ),
                        VerticalSpeacing(20),
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.blackColor,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.done,
                                  color: AppColor.whiteColor,
                                  size: 12,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "I accept the terms and privacy policy",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ],
                        ),
                        VerticalSpeacing(20),
                        RoundedButton(
                          title: "Continue",
                          onpress: () {
                            authController.loginUser(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          },
                        ),
                        VerticalSpeacing(30),
                        AuthProviderButton(
                          image: "images/google.png",
                          title: "Sign in with Google",
                        ),
                        VerticalSpeacing(10),
                        AuthProviderButton(
                          image: "images/fb.png",
                          title: "Sign in with Facebook",
                        ),
                        VerticalSpeacing(20),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: AppColor.whiteColor,
                                thickness: 1,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "or",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColor.whiteColor,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Divider(
                                color: AppColor.whiteColor,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Didn't have an account?",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColor.blackColor,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(SignUpView());
                              },
                              child: Text(
                                "Signup",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.blackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        VerticalSpeacing(20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
