import 'dart:convert';

import 'package:get/get.dart';
import 'dart:async';

import '../../../core/values/app_string.dart';
import '../../../data/api/city_api_response.dart';
import '../../../data/models/city.dart';
import '../../../data/models/region.dart';
import '../../../data/repository/country_repo.dart';

class CityController extends GetxController {
  var cities = <City>[].obs;
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

  @override
  void onInit() {
    super.onInit();
    var regionJson = Get.arguments[AppString.regionObj];
    parentRegion = Region.fromJson(jsonDecode(regionJson));
    regionCode = parentRegion.isoCode;
    countryCode = Get.arguments[AppString.countryCode];
    // countryCode = "BD";
    // regionCode = "A";
    fetchCities();
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
          cities.addAll(newEntries);
        } else {
          cities.value = newEntries;
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

  void applyFilters({
    bool ascending = true,
    String keyword = '',
    int? limit,
    String type = 'CITY',
    String sortBy = 'name',
    int minPopulation = 0,
  }) {
    var filteredList = cities.where((city) {
      return city.type == type &&
          city.population >= minPopulation &&
          city.name.toLowerCase().contains(keyword.toLowerCase());
    }).toList();

    if (!ascending) {
      filteredList.sort((a, b) => b.name.compareTo(a.name));
    } else {
      filteredList.sort((a, b) => a.name.compareTo(b.name));
    }

    if (limit != null && limit > 0) {
      filteredList = filteredList.take(limit).toList();
    }

    cities.value = filteredList;
    update(['cityList']);
  }
}
