import 'dart:convert';
import 'package:cloud_music/models/response_sub_model/track.dart';

List<TracksOfPlaylist> tracksOfPlaylistFromMap(String str) =>
    List<TracksOfPlaylist>.from(
        json.decode(str).map((x) => TracksOfPlaylist.fromMap(x)));

class TracksOfPlaylist {
  TracksOfPlaylist({
    required this.track,
    required this.thumbArt,
  });

  Track track;
  dynamic thumbArt;

  factory TracksOfPlaylist.fromMap(Map<String, dynamic> json) =>
      TracksOfPlaylist(
        track: Track.fromMap(json["track"]),
        thumbArt: json["track"]["album"]["images"][0]["url"],
      );
}
