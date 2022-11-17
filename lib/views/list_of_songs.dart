import 'package:cloud_music/views/custom/immutables.dart';
import 'package:flutter/material.dart';

import '../models/song.dart';
import 'custom/bottom_player.dart';
import 'music_player_ui.dart';

class SongsList extends StatefulWidget {
  const SongsList({Key? key}) : super(key: key);

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
            const SizedBox(height: 30),
            songList(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomPlayer(isListPage: true),
    );
  }

  Widget topMenu() {
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 40, right: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            "Popular",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "News",
            style: TextStyle(color: Colors.white54),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "Library",
            style: TextStyle(color: Colors.white54),
          )
        ],
      ),
    );
  }

  Widget songList(context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            songsTest.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 35),
                child: ListTile(
                  selectedColor: Colors.red,
                  leading: InkWell(
                    onTap: () {
                      currentPlayingSong = songsTest[index];
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
                        songsTest[index].imageSong,
                        width: 35,
                      ),
                    ),
                  ),
                  title: InkWell(
                    onTap: () {
                      currentPlayingSong = songsTest[index];
                      setState(() {});
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PlayerView(),
                        ),
                      );
                    },
                    child: Text(
                      songsTest[index].songName,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  subtitle: InkWell(
                    onTap: () {
                      currentPlayingSong = songsTest[index];
                      setState(() {});
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PlayerView(),
                        ),
                      );
                    },
                    child: Text(
                      songsTest[index].artist,
                      style: const TextStyle(color: Colors.white30),
                    ),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      songsTest[index].isUserFavourite =
                          !songsTest[index].isUserFavourite;
                      setState(() {});
                    },
                    child: Icon(
                      songsTest[index].isUserFavourite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: songsTest[index].isUserFavourite
                          ? Colors.teal
                          : Colors.white,
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
  }
}
