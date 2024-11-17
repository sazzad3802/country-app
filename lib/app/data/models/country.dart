class Country {
  String code;
  String name;
  String wikiDataId;

  Country({
    required this.code,
    required this.name,
    required this.wikiDataId,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        code: json["code"],
        name: json["name"],
        wikiDataId: json["wikiDataId"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "wikiDataId": wikiDataId,
      };
}
