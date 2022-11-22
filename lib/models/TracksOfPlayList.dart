import 'dart:convert';
import 'package:cloud_music/models/response_sub_model/track.dart';
import 'package:cloud_music/models/response_sub_model/video_thumbnail.dart';

List<TracksOfPlaylist> tracksOfPlaylistFromMap(String str) =>
    List<TracksOfPlaylist>.from(
        json.decode(str).map((x) => TracksOfPlaylist.fromMap(x)));

class TracksOfPlaylist {
  TracksOfPlaylist({
    required this.track,
    required this.videoThumbnail,
  });

  Track track;
  VideoThumbnail videoThumbnail;

  factory TracksOfPlaylist.fromMap(Map<String, dynamic> json) =>
      TracksOfPlaylist(
        track: Track.fromMap(json["track"]),
        videoThumbnail: VideoThumbnail.fromMap(json["video_thumbnail"]),
      );
}
