import 'dart:convert';

import 'package:country_app/app/core/values/app_string.dart';
import 'package:country_app/app/data/api/region_api_response.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../data/models/country.dart';
import '../../../data/models/region.dart';
import '../../../data/repository/country_repo.dart';
import '../../../network/apis.dart';
import '../../../routes/app_pages.dart';

class RegionController extends GetxController {
  var regions = <Region>[].obs;
  late Country parentCountry;
  String countryCode = "";
  var totalCount = 0.obs;
  final CountryRepo _countryRepo = Get.find();
  var rxLoading = false.obs;

  var offset = 0.obs;
  var hasMore = true.obs;

  @override
  void onInit() {
    super.onInit();
    var countryJson = Get.arguments[AppString.countryObj];
    parentCountry = Country.fromJson(jsonDecode(countryJson));
    countryCode = parentCountry.code;
    // countryCode = "BD";
    fetchRegions();
  }

  void fetchRegions({bool isLoadMore = false}) async {
    if (countryCode.isNotEmpty && (!rxLoading.value && hasMore.value)) {
      rxLoading.value = true;
      final response = await _countryRepo.getAllRegions(
        countryCode,
        offset.value,
      );
      if (response.data is RegionsApiResponse) {
        List<Region> newEntries = response.data.regionList;
        if (isLoadMore) {
          regions.addAll(newEntries);
        } else {
          regions.value = newEntries;
        }
        totalCount.value = response.data.metadata.totalCount;
        offset.value += newEntries.length;

        if (offset.value >= totalCount.value) {
          hasMore.value = false;
        }
      }
      rxLoading.value = false;
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
    var filteredList = regions.where((city) {
      return city.name.toLowerCase().contains(keyword.toLowerCase());
    }).toList();

    if (!ascending) {
      filteredList.sort((a, b) => b.name.compareTo(a.name));
    } else {
      filteredList.sort((a, b) => a.name.compareTo(b.name));
    }

    regions.value = filteredList;
  }

  void gotoCity(Region region) async {
    String regionJson = jsonEncode(region.toJson());
    await Get.toNamed(Routes.CITY_VIEW, arguments: {
      AppString.regionObj: regionJson,
      AppString.countryCode: countryCode
    });
  }
}
