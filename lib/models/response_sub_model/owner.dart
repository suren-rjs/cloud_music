import 'external_urls.dart';

class Owner {
  Owner({
    required this.displayName,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.type,
    required this.uri,
  });

  String displayName;
  ExternalUrls externalUrls;
  String href;
  String id;
  String type;
  String uri;

  factory Owner.fromMap(Map<String, dynamic> json) => Owner(
        displayName: json["display_name"],
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        type: json["type"],
        uri: json["uri"],
      );
}
