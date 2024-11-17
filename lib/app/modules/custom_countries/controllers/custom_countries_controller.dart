import 'dart:convert';

import 'package:country_app/app/data/models/custom_country.dart';
import 'package:get/get.dart';

import '../../../core/base/general_response.dart';
import '../../../core/values/app_string.dart';
import '../../../data/repository/country_repo.dart';
import '../../../routes/app_pages.dart';

class CustomCountriesController extends GetxController {
  var rxLoading = false.obs;
  var customCountries = <CustomCountry>[].obs;
  final CountryRepo _countryRepo = Get.find();

  @override
  void onInit() {
    super.onInit();
    fetchCustomCountries();
  }

  void fetchCustomCountries({bool isLoadMore = false}) async {
    rxLoading.value = true;
    GeneralResponse generalResponse = await _countryRepo.getCustomCountries();
    if (generalResponse.statusCode == 200) {
      customCountries.value = generalResponse.data;
    }
    rxLoading.value = false;
  }

  void gotoAddEditCountry(bool updateCountry,
      {CustomCountry? prevCountry}) async {
    bool? result = false;
    if (updateCountry) {
      String mJson = jsonEncode(prevCountry?.toJson());
      result = await Get.toNamed(Routes.ADD_EDIT_COUNTRIES_VIEW,
          arguments: {AppString.customCountryObj: mJson});
    } else {
      result = await Get.toNamed(Routes.ADD_EDIT_COUNTRIES_VIEW);
    }
    if (result == true) {
      fetchCustomCountries();
    }
  }

  void deleteItem(CustomCountry cc) async {
    GeneralResponse generalResponse = await _countryRepo.deleteCountry(cc.gid!);
    if (generalResponse.statusCode == 200) {
      fetchCustomCountries();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
