import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  Rx<Country?> selectedCountry = Rx<Country?>(null);
  RxList<Map<String, String>> countryList = <Map<String, String>>[
    {
      "flag": "images/usa.png",
      "Language": "English",
    },
    {
      "flag": "images/french.png",
      "Language": "French",
    },
    {
      "flag": "images/spanish.png",
      "Language": "Spanish",
    }
  ].obs;
  void setSelectedCountry(Country country) {
    selectedCountry.value = country;
  }
}
