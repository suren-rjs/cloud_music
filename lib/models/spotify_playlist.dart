import 'dart:convert';

import 'package:cloud_music/models/response_sub_model/images.dart';
import 'package:cloud_music/models/response_sub_model/tracks.dart';

import 'response_sub_model/external_urls.dart';
import 'response_sub_model/owner.dart';

List<UserPlayList> playlistFromMap(String str) => List<UserPlayList>.from(
    json.decode(str).map((x) => UserPlayList.fromMap(x)));

class UserPlayList {
  UserPlayList({
    required this.collaborative,
    required this.description,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.owner,
    required this.primaryColor,
    required this.public,
    required this.snapshotId,
    required this.tracks,
    required this.type,
    required this.uri,
  });

  bool collaborative;
  String description;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<Image> images;
  String name;
  Owner owner;
  dynamic primaryColor;
  bool public;
  String snapshotId;
  Tracks tracks;
  String type;
  String uri;

  factory UserPlayList.fromMap(Map<String, dynamic> json) => UserPlayList(
        collaborative: json["collaborative"],
        description: json["description"],
        externalUrls: ExternalUrls.fromMap(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
        name: json["name"],
        owner: Owner.fromMap(json["owner"]),
        primaryColor: json["primary_color"],
        public: json["public"],
        snapshotId: json["snapshot_id"],
        tracks: Tracks.fromMap(json["tracks"]),
        type: json["type"],
        uri: json["uri"],
      );
}
