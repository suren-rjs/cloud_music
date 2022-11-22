class ExternalIds {
  ExternalIds({
    required this.isrc,
  });

  String isrc;

  factory ExternalIds.fromMap(Map<String, dynamic> json) => ExternalIds(
        isrc: json["isrc"],
      );
}
