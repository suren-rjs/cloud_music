import 'package:cloud_music/views/custom/bottom_player.dart';
import 'package:flutter/material.dart';
import 'package:cloud_music/models/song.dart';
import 'custom/immutables.dart';
import 'custom/player_body.dart';

class PlayerView extends StatelessWidget {
  final Song songNow;

  const PlayerView({
    Key? key,
    required this.songNow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    currentPlayingSong = songNow;
    return Scaffold(
      backgroundColor: const Color(0xff2a2a2a),
      body: const PlayerBody(),
      bottomNavigationBar: BottomPlayer(isListPage: false),
    );
  }
}
