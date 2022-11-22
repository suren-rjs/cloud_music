class Tracks {
  Tracks({
    required this.href,
    required this.total,
  });

  String href;
  dynamic total;

  factory Tracks.fromMap(Map<String, dynamic> json) => Tracks(
        href: json["href"],
        total: json["total"],
      );
}
