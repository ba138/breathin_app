import 'package:breathin_app/Controllers/language_controller.dart';
import 'package:breathin_app/Utills/Resources/colors.dart';
import 'package:breathin_app/Utills/Widgets/back_button.dart';
import 'package:breathin_app/Utills/Widgets/custom_button.dart';
import 'package:breathin_app/Utills/Widgets/language_bar.dart';
import 'package:breathin_app/Utills/Widgets/search_bar.dart';
import 'package:breathin_app/Utills/Widgets/vertical_Speacing.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSelectionView extends StatelessWidget {
  const LanguageSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageController languageController = Get.put(LanguageController());

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
              Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return VerticalSpeacing(
                        10,
                      );
                    },
                    itemCount: languageController.countryList.length,
                    itemBuilder: (context, index) {
                      return LanguageBar();
                    }),
              ),
              Spacer(),
              RoundedButton(
                  title: "Continue",
                  onpress: () {
                    _showCountryPicker(context, languageController);
                  }),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  void _showCountryPicker(
      BuildContext context, LanguageController languageController) {
    showCountryPicker(
      context: context,
      onSelect: (Country country) {
        languageController.setSelectedCountry(country);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('You selected ${country.name}')),
        );
      },
    );
  }
}
