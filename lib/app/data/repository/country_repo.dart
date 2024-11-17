import 'package:country_app/app/data/services/country_service.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/base/general_response.dart';
import '../database/dao/country_dao.dart';
import '../models/custom_country.dart';

class CountryRepo {
  final CountryService _countryService = Get.find();
  final CountryDao _countryDao = Get.find();

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

  Future<GeneralResponse> getCustomCountries() async {
    var generalResponse = GeneralResponse.offline();
    var dtos = await _countryDao.getAll();
    var items = countryItemsFromDtos(dtos);
    return generalResponse.copyWith(data: items);
  }

  Future<GeneralResponse> updateCountry(CustomCountry cc) async {
    var generalResponse = GeneralResponse.offline();
    var dto = cc.toCountryDto();
    var id = await _countryDao.updateCountry(dto);
    return generalResponse.copyWith(data: id);
  }

  Future<GeneralResponse> insertCountry(CustomCountry cc) async {
    var generalResponse = GeneralResponse.offline();
    var dto = cc.toCountryDto();
    var generatedId = await _countryDao.insertCountry(dto);
    var newData = cc.copyWith(gId: generatedId);
    var newDto = newData.toCountryDto();
    var id = await _countryDao.updateCountry(newDto);
    return generalResponse.copyWith(data: id);
  }

  Future<GeneralResponse> deleteCountry(int gid) async {
    var generalResponse = GeneralResponse.offline();
    var id = await _countryDao.deleteCountry(gid);
    return generalResponse.copyWith(data: id);
  }
}
