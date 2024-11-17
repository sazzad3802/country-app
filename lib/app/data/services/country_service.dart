import 'dart:convert';

import 'package:country_app/app/data/api/city_api_response.dart';
import 'package:country_app/app/data/api/region_api_response.dart';
import 'package:flutter/foundation.dart';

import '../../core/base/general_response.dart';
import '../../network/apis.dart';
import '../../network/base_api_provider.dart';
import '../api/country_api_response.dart';
import 'package:country_app/app/network/dio_exception.dart' as dEx;

class CountryService extends BaseApiProvider {
  //

  Future<GeneralResponse> getAllCountries(String currency, int offset) async {
    try {
      var response =
          await dio.get(Apis.getCountriesByCurrency(currency, offset));
      if (response.statusCode == 200) {
        var apiResponse = CountriesApiResponse.fromJson(response.data);
        return GeneralResponse(statusCode: 200, data: apiResponse);
      }
      return GeneralResponse(
          statusCode: response.statusCode ?? 400, data: response.data);
    } catch (e) {
      print("Error: $e");
      return GeneralResponse(
          statusCode: 400, data: dEx.DioError.getDioException(e));
    }
  }

  Future<GeneralResponse> getAllRegions(String countryCode, int offset) async {
    try {
      var response =
          await dio.get(Apis.getRegionsByCountry(countryCode, offset));
      if (response.statusCode == 200) {
        var apiResponse = RegionsApiResponse.fromJson(response.data);
        return GeneralResponse(statusCode: 200, data: apiResponse);
      }
      return GeneralResponse(
          statusCode: response.statusCode ?? 400, data: response.data);
    } catch (e) {
      print("Error: $e");
      return GeneralResponse(
          statusCode: 400, data: dEx.DioError.getDioException(e));
    }
  }

  Future<GeneralResponse> getAllCities(
      String countryCode, String regionCode, int offset) async {
    try {
      var response = await dio
          .get(Apis.getCitiesByRegion(countryCode, regionCode, offset));
      if (response.statusCode == 200) {
        var apiResponse = CityApiResponse.fromJson(response.data);
        return GeneralResponse(statusCode: 200, data: apiResponse);
      }
      return GeneralResponse(
          statusCode: response.statusCode ?? 400, data: response.data);
    } catch (e) {
      print("Error: $e");
      return GeneralResponse(
          statusCode: 400, data: dEx.DioError.getDioException(e));
    }
  }
}
