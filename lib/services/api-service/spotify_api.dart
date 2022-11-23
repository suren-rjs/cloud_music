import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:cloud_music/models/TracksOfPlayList.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/spotify_playlist.dart';
import 'new_user_auth.dart';

final SpotifyApi spotifyApi = SpotifyApi();

String accessTokenGlobal =
    Hive.box('secrets').get('access-token', defaultValue: [""])[0];

class SpotifyApi {
  static final SpotifyApi _instance = SpotifyApi._internal();

  factory SpotifyApi() => _instance;

  SpotifyApi._internal();

  final List<String> _scopes = [
    'user-read-private',
    'user-read-email',
    'playlist-read-private',
    'playlist-read-collaborative',
    'app-remote-control',
    'user-modify-playback-state',
    'user-read-recently-played',
    'user-read-currently-playing',
    'user-read-playback-position',
  ];

  /// You can signup for spotify developer account and get your own clientID and clientSecret in-case you don't want to use these
  final String clientID = '8b569e23cbcd4d76ba4e6d650003b4a0';
  final String clientSecret = 'dd1e478dafda49c1864a259333784ff8';
  final String redirectUrl = 'app://widow/auth';
  final String spotifyApiBaseUrl = 'https://accounts.spotify.com/api';
  final String spotifyPlaylistBaseUrl =
      'https://api.spotify.com/v1/me/playlists';
  final String spotifyTrackBaseUrl = 'https://api.spotify.com/v1/playlists';
  final String spotifyBaseUrl = 'https://accounts.spotify.com';
  final String requestToken = 'https://accounts.spotify.com/api/token';

  String requestAuthorization() =>
      'https://accounts.spotify.com/authorize?client_id=$clientID&response_type=code&redirect_uri=$redirectUrl&scope=${_scopes.join('%20')}';

  configuration() async {
    Hive.box('settings').put(
      'preferredLanguage',
      ['English', 'Tamil'],
    );
    if (Hive.box('settings').get('userId') == null) {
      addUserData("Suren");
    }
    String code = Hive.box('secrets').get('code', defaultValue: "");
    if (code != "" &&
        Hive.box('secrets').get('access-token', defaultValue: "") != "") {
      return;
    }
    launchUrl(
      Uri.parse(
        spotifyApi.requestAuthorization(),
      ),
      mode: LaunchMode.externalApplication,
    );

    AppLinks(
      onAppLink: (Uri uri, String link) async {
        closeInAppWebView();
        if (link.contains('code=')) {
          code = link.split('code=')[1];
          Hive.box('secrets').put('code', code);
          await getAccessToken(code).then((value) {
            Hive.box('secrets').put('access-token', value);
          });
        }
      },
    );
    return;
  }

  Future<List<String>> getAccessToken(String code) async {
    final Map<String, String> headers = {
      'Authorization':
          "Basic ${base64.encode(utf8.encode("$clientID:$clientSecret"))}",
    };

    final Map<String, String> body = {
      'grant_type': 'authorization_code',
      'code': code,
      'redirect_uri': redirectUrl
    };

    try {
      final Uri path = Uri.parse(requestToken);
      final response = await post(path, headers: headers, body: body);
      if (response.statusCode == 200) {
        final Map result = jsonDecode(response.body) as Map;
        return <String>[
          result['access_token'].toString(),
          result['refresh_token'].toString()
        ];
      }
    } catch (e) {
      print('Error: $e');
    }
    return [];
  }

  Future<List<UserPlayList>> getUserPlaylists(String accessToken) async {
    try {
      final Uri path = Uri.parse('$spotifyPlaylistBaseUrl?limit=50');

      final response = await get(
        path,
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Accept': 'application/json'
        },
      );
      if (response.statusCode == 200) {
        List playList =
            Map<String, dynamic>.from(json.decode(response.body))['items'];
        return playList.map((item) => UserPlayList.fromMap(item)).toList();
      }
    } catch (e) {
      log('Error: $e');
    }
    return [];
  }

  Future<List<TracksOfPlaylist>> getTracksOfPlaylist(
    String accessToken,
    String playListId,
    int offset,
  ) async {
    try {
      final Uri path = Uri.parse(
        '$spotifyTrackBaseUrl/$playListId/tracks?limit=100&offset=$offset',
      );
      final response = await get(
        path,
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Accept': 'application/json'
        },
      );

      if (response.statusCode == 200) {
        List tracks =
            Map<String, dynamic>.from(json.decode(response.body))['items'];
        // log('${tracks}');
        return tracks.map((e) => TracksOfPlaylist.fromMap(e)).toList();
      } else {
        // accessTokenGlobal = "";
        // Hive.box('secrets').clear();
      }
    } catch (e) {
      log('Error: $e');
    }
    return [];
  }
}
