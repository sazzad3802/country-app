class Metadata {
  int currentOffset;
  int totalCount;

  Metadata({
    required this.currentOffset,
    required this.totalCount,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        currentOffset: json["currentOffset"],
        totalCount: json["totalCount"],
      );

  Map<String, dynamic> toJson() => {
        "currentOffset": currentOffset,
        "totalCount": totalCount,
      };
}
