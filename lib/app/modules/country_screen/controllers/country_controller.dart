import 'dart:convert';

import 'package:country_app/app/core/values/app_string.dart';
import 'package:country_app/app/data/repository/country_repo.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../core/values/app_assets.dart';
import '../../../data/api/country_api_response.dart';
import '../../../data/models/country.dart';
import '../../../routes/app_pages.dart';

class CountryController extends GetxController {
  var countries = <Country>[].obs;
  var selectedCurrency = ''.obs;
  var totalCount = 0.obs;
  final CountryRepo _countryRepo = Get.find();
  Map<String, String> currencies = {};
  var rxLoading = false.obs;

  var offset = 0.obs;
  var hasMore = true.obs;

  @override
  void onInit() {
    super.onInit();
    getCurrencyFromAsset();
  }

  Future<void> getCurrencyFromAsset() async {
    var dataStr = await rootBundle.loadString(AppAssets.currencyJson);
    final Map<String, String> data =
        Map<String, String>.from(jsonDecode(dataStr));
    currencies = data;
    selectedCurrency.value = currencies.keys.first;
  }

  void fetchCountries(
      {bool isLoadMore = false, bool findCountry = false}) async {
    if (selectedCurrency.value.isNotEmpty) {
      if (!rxLoading.value && hasMore.value) {
        rxLoading.value = true;
        if (findCountry) {
          countries.value = [];
          offset.value = 0;
        }
        final response = await _countryRepo.getAllCountries(
          selectedCurrency.value,
          offset.value,
        );
        if (response.data is CountriesApiResponse) {
          List<Country> newEntries = response.data.countryList;
          if (isLoadMore) {
            countries.addAll(newEntries);
          } else {
            countries.value = newEntries;
          }
          totalCount.value = response.data.metadata.totalCount;
          offset.value += newEntries.length;

          if (offset.value >= totalCount.value) {
            hasMore.value = false;
          }
        }
        rxLoading.value = false;
      }
    } else {
      Fluttertoast.showToast(msg: "select a currency first");
    }
  }

  void setCurrency(String? value) {
    if (selectedCurrency.value.isEmpty) {
      selectedCurrency.value = value!;
    } else if (value != selectedCurrency.value) {
      selectedCurrency.value = value!;
      hasMore.value = true;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void applyFilters({
    bool ascending = true,
    String keyword = '',
  }) {
    var filteredList = countries.where((city) {
      return city.name.toLowerCase().contains(keyword.toLowerCase());
    }).toList();

    if (!ascending) {
      filteredList.sort((a, b) => b.name.compareTo(a.name));
    } else {
      filteredList.sort((a, b) => a.name.compareTo(b.name));
    }

    countries.value = filteredList;
  }

  void gotoRegion(Country country) async {
    String countryJson = jsonEncode(country.toJson());
    await Get.toNamed(Routes.REGION_VIEW,
        arguments: {AppString.countryObj: countryJson});
  }
}
