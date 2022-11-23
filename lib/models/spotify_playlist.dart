import 'dart:convert';

List<UserPlayList> playlistFromMap(String str) => List<UserPlayList>.from(
    json.decode(str).map((x) => UserPlayList.fromMap(x)));

class UserPlayList {
  UserPlayList({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  String id;
  String name;
  String imageUrl;

  factory UserPlayList.fromMap(Map<String, dynamic> json) => UserPlayList(
        id: json["id"],
        name: json["name"],
        imageUrl: json["images"][0]['url'],
      );
}
