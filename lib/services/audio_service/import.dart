import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:cloud_music/services/api-service/spotify_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ImportPlaylist extends StatelessWidget {
  ImportPlaylist({super.key});

  final Box settingsBox = Hive.box('settings');
  final List playlistNames =
      Hive.box('settings').get('playlistNames')?.toList() as List? ??
          ['Favorite Songs'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.importPlaylist,
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.transparent
                  : Theme.of(context).colorScheme.secondary,
              elevation: 0,
            ),
            body: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: 5,
              itemBuilder: (cntxt, index) {
                return ListTile(
                  title: Text(AppLocalizations.of(context)!.importSpotify),
                  leading: const SizedBox.square(
                    dimension: 50,
                    child: Center(
                      child: Icon(MdiIcons.spotify),
                    ),
                  ),
                  onTap: () {
                    importSpotify(
                      cntxt,
                      playlistNames,
                      settingsBox,
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

void importSpotify(BuildContext context, List playlistNames, Box settingsBox) {
  String code;
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
        await fetchPlaylists(
          code,
          context,
          playlistNames,
          settingsBox,
        );
      }
    },
  );
}

Future<void> fetchPlaylists(
  String code,
  BuildContext context,
  List playlistNames,
  Box settingsBox,
) async {
  final List data = await spotifyApi.getAccessToken(code);
  if (data.isNotEmpty) {
    final String accessToken = data[0].toString();
    final List spotifyPlaylists =
        await spotifyApi.getUserPlaylists(accessToken);
    log("Spotify Playlists = $spotifyPlaylists");
  } else {
    print('Failed');
  }
  return;
}
