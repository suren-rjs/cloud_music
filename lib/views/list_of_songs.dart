import 'package:cloud_music/models/TracksOfPlayList.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../services/api-service/spotify_api.dart';
import 'custom/bottom_player.dart';
import 'music_player_ui.dart';

class SongsList extends StatefulWidget {
  SongsList({Key? key, required this.playlistName, required this.playlistId})
      : super(key: key);
  String playlistName;
  String playlistId;

  @override
  State<SongsList> createState() => _SongsListState();
}

class _SongsListState extends State<SongsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2a2a2a),
      body: SafeArea(
        child: Column(
          children: [
            topMenu(),
            const SizedBox(height: 15),
            songList(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomPlayer(isPlayeListScreen: true),
    );
  }

  Widget topMenu() {
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 30, right: 40),
      child: Text(
        widget.playlistName,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22),
      ),
    );
  }

  Widget songList(context) {
    return FutureBuilder<List<TracksOfPlaylist>>(
        future: spotifyApi.getTracksOfPlaylist(
            Hive.box('secrets').get('access-token', defaultValue: [""])[0],
            widget.playlistId,
            0),
        builder: (context, AsyncSnapshot<List<TracksOfPlaylist>> snapshot) {
          if (snapshot.hasData) {
            List<TracksOfPlaylist>? list = snapshot.data;
            return Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    list!.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 25),
                        child: ListTile(
                          selectedColor: Colors.red,
                          leading: InkWell(
                            onTap: () {
                              // currentPlayingSong = list[index];
                              setState(() {});
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PlayerView(),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                "${list[index].videoThumbnail.url}",
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.music_note_outlined,
                                    color: Colors.white,
                                  );
                                },
                                width: 40,
                              ),
                            ),
                          ),
                          title: InkWell(
                            onTap: () {
                              // currentPlayingSong = songsTest[index];
                              setState(() {});
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PlayerView(),
                                ),
                              );
                            },
                            child: Text(
                              list[index].track.name.length < 36
                                  ? list[index].track.name
                                  : "${list[index].track.name.substring(0, 37)}...",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          subtitle: InkWell(
                            onTap: () {
                              // currentPlayingSong = songsTest[index];
                              setState(() {});
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PlayerView(),
                                ),
                              );
                            },
                            child: Text(
                              list[index].track.type,
                              style: const TextStyle(color: Colors.white30),
                            ),
                          ),
                          trailing: InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: const Icon(
                              // list[index].isUserFavourite
                              //     ? Icons.favorite
                              //     :
                              Icons.favorite_border,
                              // color: list[index].isUserFavourite
                              //     ? Colors.pink
                              //     :
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const Text("Error");
          } else {
            return const Text("Loading...");
          }
        });
  }
}
