class Region {
  String countryCode;
  String isoCode;
  String name;
  String wikiDataId;

  Region({
    required this.countryCode,
    required this.isoCode,
    required this.name,
    required this.wikiDataId,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        countryCode: json["countryCode"],
        isoCode: json["isoCode"],
        name: json["name"],
        wikiDataId: json["wikiDataId"],
      );

  Map<String, dynamic> toJson() => {
        "countryCode": countryCode,
        "isoCode": isoCode,
        "name": name,
        "wikiDataId": wikiDataId,
      };
}
