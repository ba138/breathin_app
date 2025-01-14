import 'package:breathin_app/Controllers/auth_controller.dart';
import 'package:breathin_app/Utills/Resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class RoundedButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpress;
  Color? buttonColor;
  Color? titleColor;

  RoundedButton({
    super.key,
    required this.title,
    required this.onpress,
    this.loading = false,
    this.buttonColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    final SignupController signupController = Get.put(SignupController());

    return InkWell(
      onTap: onpress,
      child: Container(
          height: 56.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: buttonColor ?? AppColor.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Obx(() {
            return Center(
              child: signupController.isLoading.value
                  ? const CircularProgressIndicator(
                      color: AppColor.whiteColor,
                    )
                  : Text(
                      title,
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: titleColor ?? AppColor.blackColor,
                        ),
                      ),
                    ),
            );
          })),
    );
  }
}
