import 'package:country_app/app/data/database/database_provider.dart';
import 'package:drift/drift.dart' as drift;

List<CustomCountry> countryItemsFromDtos(List<CountryDtoData> dtos) =>
    List<CustomCountry>.from(
        dtos.map((dto) => CustomCountry.fromCountryDto(dto)));

class CustomCountry {
  int? gid;
  String? name;
  String? latitude;
  String? longitude;
  String? population;

  CustomCountry({
    this.gid,
    this.name,
    this.latitude,
    this.longitude,
    this.population,
  });

  factory CustomCountry.fromJson(Map<String, dynamic> json) => CustomCountry(
        gid: json["gid"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        population: json["population"],
      );

  Map<String, dynamic> toJson() => {
        "gid": gid,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "population": population,
      };

  CountryDtoCompanion toCountryDto() => CountryDtoCompanion(
        gid: drift.Value(gid ?? 0),
        name: drift.Value(name ?? ''),
        latitude: drift.Value(latitude ?? ''),
        longitude: drift.Value(longitude ?? ''),
        population: drift.Value(population ?? ''),
      );

  factory CustomCountry.fromCountryDto(CountryDtoData dto) => CustomCountry(
        gid: dto.gid,
        name: dto.name,
        latitude: dto.latitude,
        longitude: dto.longitude,
        population: dto.population,
      );

  CustomCountry copyWith({
    int? gId,
  }) =>
      CustomCountry(
        gid: gId ?? gid,
        name: name,
        latitude: latitude,
        longitude: longitude,
        population: population,
      );
}
