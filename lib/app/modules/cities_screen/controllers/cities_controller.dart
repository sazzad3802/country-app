import 'dart:convert';

import 'package:country_app/app/enums/sort_type.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:async';

import '../../../core/values/app_string.dart';
import '../../../data/api/city_api_response.dart';
import '../../../data/models/city.dart';
import '../../../data/models/region.dart';
import '../../../data/repository/country_repo.dart';
import '../../../enums/sort_status.dart';

class CityController extends GetxController {
  var cities = <City>[].obs;
  var allCities = <City>[];
  var expandedCities = <int, bool>{}.obs;
  var collapseTimers = <int, Timer>{}.obs;
  var totalCount = 0.obs;

  late Region parentRegion;
  String regionCode = "";
  String countryCode = "";
  final CountryRepo _countryRepo = Get.find();
  var rxLoading = false.obs;

  var offset = 0.obs;
  var hasMore = true.obs;

  var rxSelectedSortStatus = SortStatusEnum.Ascending.name.obs;
  var rxSelectedSortType = SortTypeEnum.Name.name.obs;

  var rxSortList = <String>[
    SortStatusEnum.Ascending.name,
    SortStatusEnum.Descending.name
  ].obs;

  var rxSortTypeList =
      <String>[SortTypeEnum.Name.name, SortTypeEnum.Population.name].obs;

  var searchController = TextEditingController().obs;
  var minPopulationController = TextEditingController(text: "0").obs;

  @override
  void onInit() {
    super.onInit();
    var regionJson = Get.arguments[AppString.regionObj];
    parentRegion = Region.fromJson(jsonDecode(regionJson));
    regionCode = parentRegion.isoCode;
    countryCode = Get.arguments[AppString.countryCode];
    fetchCities(isLoadMore: true);
  }

  void fetchCities({bool isLoadMore = false}) async {
    if (regionCode.isNotEmpty && (!rxLoading.value && hasMore.value)) {
      rxLoading.value = true;
      final response = await _countryRepo.getAllCities(
        countryCode,
        regionCode,
        offset.value,
      );
      if (response.data is CityApiResponse) {
        List<City> newEntries = response.data.citiList;
        if (isLoadMore) {
          allCities.addAll(newEntries);
          cities.addAll(newEntries);
        } else {
          cities.value = newEntries;
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

  void toggleExpansion(int cityId) {
    if (expandedCities.containsKey(cityId) && expandedCities[cityId]!) {
      expandedCities[cityId] = false;
      collapseTimers[cityId]?.cancel();
      collapseTimers.remove(cityId);
    } else {
      expandedCities[cityId] = true;
      Timer timer = Timer(Duration(seconds: 30), () {
        expandedCities[cityId] = false;
        update();
      });
      collapseTimers[cityId] = timer;
    }
    update();
  }

  @override
  void onClose() {
    collapseTimers.forEach((_, timer) {
      timer.cancel();
    });
    super.onClose();
  }

  void setSort(String value) {
    if (value != rxSelectedSortStatus.value) {
      rxSelectedSortStatus.value = value;
    }
  }

  void setSortType(String value) {
    if (value != rxSelectedSortType.value) {
      rxSelectedSortType.value = value;
    }
  }

  void setSearch(String value) {
    searchController.value.text = value;
  }

  void setMinPopulation(String value) {
    minPopulationController.value.text = value;
  }

  Future<void> sortList() async {
    var myParam = rxSelectedSortType.value == SortTypeEnum.Name.name
        ? SortTypeEnum.Name.name.toLowerCase()
        : SortTypeEnum.Population.name.toLowerCase();
    if (rxSelectedSortStatus.value == SortStatusEnum.Descending.name) {
      cities.sort((a, b) => b.toJson()[myParam].compareTo(a.toJson()[myParam]));
    } else {
      cities.sort((a, b) => a.toJson()[myParam].compareTo(b.toJson()[myParam]));
    }
  }

  Future<void> searchList() async {
    final tempList = [...allCities];
    var filteredList = tempList.where((city) {
      return city.name
          .toLowerCase()
          .contains(searchController.value.text.toLowerCase());
    }).toList();
    cities.value = filteredList;
  }

  Future<void> searchMinPopulation() async {
    final tempList = [...cities];
    var filteredList = tempList.where((city) {
      try {
        return city.population >
            double.parse(minPopulationController.value.text).round();
      } on Exception catch (e) {
        try {
          return city.population >
              int.parse(minPopulationController.value.text);
        } on Exception catch (e) {
          Fluttertoast.showToast(msg: "parsing error");
          return throw ("parsing error");
        }
      }
    }).toList();
    cities.value = filteredList;
  }

  void applyFilters() async {
    await searchList();
    await searchMinPopulation();
    await sortList();
  }
}
