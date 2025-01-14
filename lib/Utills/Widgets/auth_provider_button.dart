// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:breathin_app/Utills/Resources/colors.dart';

class AuthProviderButton extends StatelessWidget {
  final String image;
  final String title;
  const AuthProviderButton({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        border: Border.all(color: AppColor.blackColor),
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 20,
            width: 20,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColor.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
