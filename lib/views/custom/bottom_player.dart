import 'package:cloud_music/views/controller/controller_buttons.dart';
import 'package:cloud_music/views/music_player_ui.dart';
import 'package:flutter/material.dart';

import '../controller/progress_bar.dart';
import 'immutables.dart';

class BottomPlayer extends StatefulWidget {
  BottomPlayer({Key? key, required this.isPlayeListScreen}) : super(key: key);

  late bool isPlayeListScreen;

  @override
  State<BottomPlayer> createState() => _BottomPlayerState();
}

class _BottomPlayerState extends State<BottomPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0x649E9E9E),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.isPlayeListScreen ? 10.0 : 5.0),
            topRight: Radius.circular(widget.isPlayeListScreen ? 10.0 : 5.0),
          )),
      height: widget.isPlayeListScreen ? 179 : 130,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: widget.isPlayeListScreen ? 0 : 15),
                  widget.isPlayeListScreen
                      ? InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PlayerView(),
                              ),
                            );
                          },
                          child: Row(
                            textDirection: TextDirection.ltr,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 45,
                                width: 45,
                                child: customWidgets.playerImageNow(),
                              ),
                              const SizedBox(width: 50),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    currentPlayingSong.songName,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.fade,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    softWrap: true,
                                    currentPlayingSong.artist,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w100,
                                      overflow: TextOverflow.fade,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 100),
                            ],
                          ),
                        )
                      : Container(),
                  SizedBox(height: widget.isPlayeListScreen ? 20 : 0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3.5),
                      child: const AudioProgressBar(),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  RepeatButton(),
                  PreviousSongButton(),
                  PlayButton(),
                  NextSongButton(),
                  FavouriteButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
