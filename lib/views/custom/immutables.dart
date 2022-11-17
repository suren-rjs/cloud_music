import 'package:flutter/material.dart';

import '../../models/song.dart';

Song currentPlayingSong = songsTest[0];

CustomWidgets customWidgets = CustomWidgets();

class CustomWidgets {
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
