import 'package:breathin_app/Utills/Resources/colors.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.grayColor.withValues(alpha: 0.3),
        ),
        borderRadius: BorderRadius.circular(
          6,
        ),
      ),
      child: Center(
          child: Icon(
        Icons.arrow_back_ios_outlined,
        size: 18,
      )),
    );
  }
}
