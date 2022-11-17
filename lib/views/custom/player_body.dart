import 'package:cloud_music/views/custom/immutables.dart';
import 'package:flutter/material.dart';

class PlayerBody extends StatefulWidget {
  const PlayerBody({Key? key}) : super(key: key);

  @override
  State<PlayerBody> createState() => _PlayerBodyState();
}

class _PlayerBodyState extends State<PlayerBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customWidgets.playerImageNow(),
              const SizedBox(height: 50),
              Text(
                currentPlayingSong.songName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                currentPlayingSong.artist,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
