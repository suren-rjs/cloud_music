import 'external_urls.dart';

class AddedBy {
  AddedBy({
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.type,
    required this.uri,
    required this.name,
  });

  ExternalUrls externalUrls;
  String href;
  String id;
  String type;
  String uri;
  String name;

  factory AddedBy.fromMap(Map<String, dynamic> json) => AddedBy(
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        type: json["type"],
        uri: json["uri"],
        name: json["name"] == null ? null : json["name"],
      );
}
