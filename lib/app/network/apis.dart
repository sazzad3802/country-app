import '../core/base/app_config.dart';

class Apis {
  static var baseUrl = AppConfig.shared.baseUrl;
  static var limit = 10;

  static var keyTitle = 'x-rapidapi-key';
  static var apiKey = "1c8bec90d8msh4fe16494e72b79ep16f4c4jsn4f21e6d6fea7";

  static get login => '$baseUrl/login/token';
  static get registration => '$baseUrl/mobile/save';

  static String getCountriesByCurrency(currency, offset) =>
      '$baseUrl/countries?currencyCode=$currency&limit=$limit&offset=$offset';

  static String getRegionsByCountry(countryCode, offset) =>
      '$baseUrl/countries/$countryCode/regions?limit=$limit&offset=$offset';

  static String getCitiesByRegion(countryCode, regionCode, offset) =>
      '$baseUrl/countries/$countryCode/regions/$regionCode/cities?limit=$limit&offset=$offset';
}
