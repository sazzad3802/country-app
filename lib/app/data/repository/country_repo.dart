import 'package:country_app/app/data/services/country_service.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/base/general_response.dart';

class CountryRepo {
  final CountryService _countryService = Get.find();

  Future<GeneralResponse> getAllCountries(String currency, int offset) async {
    return _countryService.getAllCountries(currency, offset);
  }

  Future<GeneralResponse> getAllRegions(String countryCode, int offset) async {
    return _countryService.getAllRegions(countryCode, offset);
  }

  Future<GeneralResponse> getAllCities(
      String countryCode, String regionCode, int offset) async {
    return _countryService.getAllCities(countryCode, regionCode, offset);
  }
}
