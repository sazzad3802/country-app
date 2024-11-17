class City {
  int id;
  String wikiDataId;
  String type;
  String city;
  String name;
  double latitude;
  double longitude;
  int population;

  City({
    required this.id,
    required this.wikiDataId,
    required this.type,
    required this.city,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.population,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        wikiDataId: json["wikiDataId"],
        type: json["type"],
        city: json["city"],
        name: json["name"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        population: json["population"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "wikiDataId": wikiDataId,
        "type": type,
        "city": city,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "population": population,
      };
}
