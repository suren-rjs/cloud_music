import 'package:cloud_music/views/music_player_ui.dart';
import 'package:flutter/material.dart';

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
      height: widget.isPlayeListScreen ? 175 : 120,
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: const LinearProgressIndicator(
                      value: 0.8,
                      backgroundColor: Color(0x70767676),
                      color: Color(0x8bffffff),
                      semanticsLabel: 'Progress',
                      minHeight: 3.75,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Text(
                        "2:32",
                        style: TextStyle(color: Colors.white70),
                      ),
                      Spacer(),
                      Text(
                        "5:29",
                        style: TextStyle(color: Colors.white70),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.repeat_outlined,
                    color: Colors.white60,
                    size: 18,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white60,
                    size: 18,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.play_circle_filled_outlined,
                    color: Colors.white60,
                    size: 40,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white60,
                    size: 18,
                  ),
                ),
                InkWell(
                  onTap: () {
                    currentPlayingSong.isUserFavourite =
                        !currentPlayingSong.isUserFavourite;
                    setState(() {});
                  },
                  child: Icon(
                    currentPlayingSong.isUserFavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: currentPlayingSong.isUserFavourite
                        ? Colors.pink
                        : Colors.white60,
                    size: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
