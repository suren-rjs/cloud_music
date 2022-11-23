class Track {
  Track({
    required this.artist,
    required this.name,
  });

  String artist;
  String name;

  factory Track.fromMap(Map<String, dynamic> json) => Track(
        artist: json["album"]['artists'][0]['name'],
        name: json["name"],
      );
}
