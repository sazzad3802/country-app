import '../models/city.dart';
import '../models/metadata.dart';

class CityApiResponse {
  List<City> citiList;
  Metadata metadata;

  CityApiResponse({
    required this.citiList,
    required this.metadata,
  });

  factory CityApiResponse.fromJson(Map<String, dynamic> json) =>
      CityApiResponse(
        citiList: List<City>.from(json["data"].map((x) => City.fromJson(x))),
        metadata: Metadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(citiList.map((x) => x.toJson())),
        "metadata": metadata.toJson(),
      };
}
