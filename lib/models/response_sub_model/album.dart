import 'added_by.dart';
import 'external_urls.dart';
import 'images.dart';

class Album {
  Album({
    required this.albumType,
    required this.artists,
    required this.availableMarkets,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.releaseDate,
    required this.releaseDatePrecision,
    required this.totalTracks,
    required this.type,
    required this.uri,
  });

  String albumType;
  List<AddedBy> artists;
  List<String> availableMarkets;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<Image> images;
  String name;
  DateTime releaseDate;
  String releaseDatePrecision;
  int totalTracks;
  String type;
  String uri;

  factory Album.fromMap(Map<String, dynamic> json) => Album(
        albumType: json["album_type"],
        artists:
            List<AddedBy>.from(json["artists"].map((x) => AddedBy.fromMap(x))),
        availableMarkets:
            List<String>.from(json["available_markets"].map((x) => x)),
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
        name: json["name"],
        releaseDate: DateTime.parse(json["release_date"]),
        releaseDatePrecision: json["release_date_precision"],
        totalTracks: json["total_tracks"],
        type: json["type"],
        uri: json["uri"],
      );
}
