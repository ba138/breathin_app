import 'package:breathin_app/Controllers/auth_controller.dart';
import 'package:breathin_app/Utills/Resources/colors.dart';
import 'package:breathin_app/Utills/Widgets/back_button.dart';
import 'package:breathin_app/Utills/Widgets/custom_button.dart';
import 'package:breathin_app/Utills/Widgets/language_bar.dart';
import 'package:breathin_app/Utills/Widgets/search_bar.dart';
import 'package:breathin_app/Utills/Widgets/vertical_Speacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSelectionView extends StatelessWidget {
  const LanguageSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController languageController = Get.put(AuthController());

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBackButton(),
              VerticalSpeacing(20),
              Text(
                "Choose the language",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Raglika Font',
                ),
              ),
              Text(
                "Please select your language, you can always change your preference in settings.",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.grayColor,
                ),
              ),
              VerticalSpeacing(
                16,
              ),
              CustomSearchBar(),
              VerticalSpeacing(
                16,
              ),
              Obx(
                () {
                  return Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return VerticalSpeacing(
                            10,
                          );
                        },
                        itemCount: languageController.countryList.length,
                        itemBuilder: (context, index) {
                          var country = languageController.countryList[index];
                          return LanguageBar(
                            flag: country['flag']!,
                            language: country['language']!,
                            ontap: () {
                              if (languageController.selectLanguage
                                  .contains(country['language']!)) {
                                languageController.selectLanguage
                                    .remove(country['language']!);
                              } else {
                                languageController.selectLanguage.clear();
                                languageController.selectLanguage
                                    .add(country['language']!);
                              }
                            },
                          );
                        }),
                  );
                },
              ),
              Spacer(),
              RoundedButton(
                  title: "Continue",
                  onpress: () {
                    languageController
                        .updateLanguage(languageController.selectLanguage[0]!);
                  }),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
