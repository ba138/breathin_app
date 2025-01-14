import 'package:breathin_app/Utills/Resources/colors.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8,
        ),
        color: AppColor.whiteColor,
        border: Border.all(
          color: Color(0xFFD8DADC),
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(
            color: AppColor.grayColor,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColor.grayColor,
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
