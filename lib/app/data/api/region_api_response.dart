import '../models/metadata.dart';
import '../models/region.dart';

class RegionsApiResponse {
  List<Region> regionList;
  Metadata metadata;

  RegionsApiResponse({
    required this.regionList,
    required this.metadata,
  });

  factory RegionsApiResponse.fromJson(Map<String, dynamic> json) =>
      RegionsApiResponse(
        regionList:
            List<Region>.from(json["data"].map((x) => Region.fromJson(x))),
        metadata: Metadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(regionList.map((x) => x.toJson())),
        "metadata": metadata.toJson(),
      };
}
