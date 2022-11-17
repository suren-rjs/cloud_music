import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_music/models/song.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

late Song currentPlayingSong;

class PlayerView extends StatelessWidget {
  final Song songNow;

  const PlayerView({
    Key? key,
    required this.songNow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    currentPlayingSong = songNow;
    return const Scaffold(
      backgroundColor: Color(0xff2a2a2a),
      body: PlayerBody(),
      bottomNavigationBar: PlayerNavigationBar(),
    );
  }
}

class PlayerBody extends StatelessWidget {
  const PlayerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}

Widget playerImageNow() {
  return SizedBox(
    width: 220,
    height: 220,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(110),
      child: Image.network(currentPlayingSong.imageSong),
    ),
  );
}

class PlayerNavigationBar extends StatelessWidget {
  const PlayerNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xff181A20),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          )),
      height: 175,
      // color: const Color(0xff2a2a2a),
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
                  Row(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 45,
                        width: 45,
                        child: playerImageNow(),
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
                      SizedBox(width: 100),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: const LinearProgressIndicator(
                      value: 0.8,
                      backgroundColor: Color(0xff22242a),
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
            actionButtons(),
          ],
        ),
      ),
    );
  }

  Widget actionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Icon(
          Icons.repeat_outlined,
          color: Colors.white60,
          size: 18,
        ),
        Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.white60,
          size: 18,
        ),
        Icon(
          Icons.play_circle_filled_outlined,
          color: Colors.white60,
          size: 40,
        ),
        Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white60,
          size: 18,
        ),
        Icon(
          Icons.favorite_border,
          color: Colors.white60,
          size: 18,
        ),
      ],
    );
  }
}
