class ExternalUrls {
  ExternalUrls({
    required this.spotify,
  });

  String spotify;

  factory ExternalUrls.fromMap(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
      );
}
