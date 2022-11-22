import 'added_by.dart';
import 'album.dart';
import 'external_ids.dart';
import 'external_urls.dart';

class Track {
  Track({
    required this.discNumber,
    required this.durationMs,
    required this.href,
    required this.id,
    required this.name,
    required this.trackNumber,
    required this.type,
    required this.uri,
  });

  int discNumber;
  int durationMs;
  String href;
  String id;
  String name;
  int trackNumber;
  String type;
  String uri;

  factory Track.fromMap(Map<String, dynamic> json) => Track(
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        href: json["href"],
        id: json["id"],
        name: json["name"],
        trackNumber: json["track_number"],
        type: json["type"],
        uri: json["uri"],
      );
}
