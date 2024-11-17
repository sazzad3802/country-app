import 'dart:convert';

import '../models/country.dart';
import '../models/metadata.dart';

class CountriesApiResponse {
  List<Country> countryList;
  Metadata metadata;

  CountriesApiResponse({
    required this.countryList,
    required this.metadata,
  });

  factory CountriesApiResponse.fromJson(Map<String, dynamic> json) =>
      CountriesApiResponse(
        countryList:
            List<Country>.from(json["data"].map((x) => Country.fromJson(x))),
        metadata: Metadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(countryList.map((x) => x.toJson())),
        "metadata": metadata.toJson(),
      };
}
