import 'package:breathin_app/Controllers/auth_controller.dart';
import 'package:breathin_app/Controllers/language_controller.dart';
import 'package:breathin_app/Utills/Resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageBar extends StatelessWidget {
  final String flag;
  final String language;
  final VoidCallback ontap;
  const LanguageBar(
      {super.key,
      required this.flag,
      required this.language,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    final SignupController languageController = Get.put(SignupController());

    return Obx(() {
      return InkWell(
        onTap: ontap,
        child: Container(
          height: 46,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8,
            ),
            border: Border.all(
              color: languageController.selectLanguage.contains(language)
                  ? AppColor.grayColor
                  : Colors.transparent,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Image.asset(
                    flag,
                    height: 25,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    language,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ]),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: languageController.selectLanguage.contains(language)
                        ? AppColor.blackColor
                        : Colors.transparent,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.done,
                      color:
                          languageController.selectLanguage.contains(language)
                              ? AppColor.whiteColor
                              : Colors.transparent,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
