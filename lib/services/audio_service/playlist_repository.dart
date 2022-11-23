import 'dart:developer';

import 'package:cloud_music/services/api-service/spotify_api.dart';
import 'package:cloud_music/views/controller/playlist_manager.dart';
import 'package:hive/hive.dart';

import '../../views/list_of_songs.dart';

abstract class PlaylistRepository {
  Future<List<Map<String, String>>> fetchInitialPlaylist();

  Future<Map<String, String>> fetchAnotherSong();
}

class DemoPlaylist extends PlaylistRepository {
  @override
  Future<List<Map<String, String>>> fetchInitialPlaylist() async {
    playListOfUser = await spotifyApi.getUserPlaylists(
        Hive.box('secrets').get('access-token', defaultValue: [""])[0]);
    listOfSongs = await spotifyApi.getTracksOfPlaylist(
        Hive.box('secrets').get('access-token', defaultValue: [""])[0],
        playListOfUser![0].id,
        0);
    listOfSongs?.forEach((song) {
      // log('${song.track.name} - ${song.track.artist}');
    });
    return List.generate(3, (index) => _nextSong());
  }

  @override
  Future<Map<String, String>> fetchAnotherSong() async {
    return _nextSong();
  }

  var _songIndex = 0;
  static const _maxSongNumber = 16;

  Map<String, String> _nextSong() {
    _songIndex = (_songIndex % _maxSongNumber) + 1;
    return {
      'id': _songIndex.toString().padLeft(3, '0'),
      'title': 'Song ${_songIndex}',
      'album': _songIndex.toString(),
      'url':
          "https://p.scdn.co/mp3-preview/c43c71de08858a0d185d0f0e44bd91b993b6b140",
    };
  }
}
