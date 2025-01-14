import 'package:breathin_app/Utills/Resources/colors.dart';
import 'package:flutter/material.dart';

class LanguageBar extends StatelessWidget {
  const LanguageBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8,
        ),
        border: Border.all(
          color: AppColor.grayColor,
        ),
      ),
      child: Row(
        children: [
          Text("language,"),
        ],
      ),
    );
  }
}
