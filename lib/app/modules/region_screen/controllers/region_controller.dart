import 'dart:convert';

import 'package:country_app/app/core/values/app_string.dart';
import 'package:country_app/app/data/api/region_api_response.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../data/models/country.dart';
import '../../../data/models/region.dart';
import '../../../data/repository/country_repo.dart';
import '../../../enums/sort_status.dart';
import '../../../network/apis.dart';
import '../../../routes/app_pages.dart';

class RegionController extends GetxController {
  var regions = <Region>[].obs;
  var allRegions = <Region>[];
  late Country parentCountry;
  String countryCode = "";
  var totalCount = 0.obs;
  final CountryRepo _countryRepo = Get.find();
  var rxLoading = false.obs;

  var offset = 0.obs;
  var hasMore = true.obs;

  var rxSelectedSortStatus = SortStatusEnum.Ascending.name.obs;

  var rxSortList = <String>[
    SortStatusEnum.Ascending.name,
    SortStatusEnum.Descending.name
  ].obs;

  var searchController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    var countryJson = Get.arguments[AppString.countryObj];
    parentCountry = Country.fromJson(jsonDecode(countryJson));
    countryCode = parentCountry.code;
    fetchRegions(isLoadMore: true);
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
          allRegions.addAll(newEntries);
          regions.addAll(newEntries);
        } else {
          regions.value = newEntries;
        }
        applyFilters();
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

  void gotoCity(Region region) async {
    String regionJson = jsonEncode(region.toJson());
    await Get.toNamed(Routes.CITY_VIEW, arguments: {
      AppString.regionObj: regionJson,
      AppString.countryCode: countryCode
    });
  }

  void setSort(String value) {
    if (value != rxSelectedSortStatus.value) {
      rxSelectedSortStatus.value = value;
    }
  }

  void setSearch(String value) {
    searchController.value.text = value;
  }

  Future<void> sortList() async {
    if (rxSelectedSortStatus.value == SortStatusEnum.Descending.name) {
      regions.sort((a, b) => b.name.compareTo(a.name));
    } else {
      regions.sort((a, b) => a.name.compareTo(b.name));
    }
  }

  Future<void> searchList() async {
    final tempList = [...allRegions];
    var filteredList = tempList.where((country) {
      return country.name
          .toLowerCase()
          .contains(searchController.value.text.toLowerCase());
    }).toList();
    regions.value = filteredList;
  }

  void applyFilters() async {
    await searchList();
    await sortList();
  }
}
