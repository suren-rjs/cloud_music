import 'package:flutter/material.dart';

import '../../models/song.dart';
import '../list_of_songs.dart';

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
      children: [
        const Icon(
          Icons.repeat_outlined,
          color: Colors.white60,
          size: 18,
        ),
        const Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.white60,
          size: 18,
        ),
        const Icon(
          Icons.play_circle_filled_outlined,
          color: Colors.white60,
          size: 40,
        ),
        const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white60,
          size: 18,
        ),
        Icon(
          currentPlayingSong.isUserFavourite
              ? Icons.favorite
              : Icons.favorite_border,
          color:
              currentPlayingSong.isUserFavourite ? Colors.teal : Colors.white,
          size: 18,
        ),
      ],
    );
  }
}

InkWell favouriteChip(int index, String url, context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SongsList(
            playlistName: 'Favourites',
            playlistId: '',
          ),
        ),
      );
    },
    child: Container(
      width: 130,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(2)),
        color: const Color(0xff2a2a2a),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
          opacity: 0.7,
        ),
      ),
      margin: const EdgeInsets.all(3.5),
      alignment: Alignment.center,
      child: Text(
        index.toString(),
        style: const TextStyle(
          color: Colors.white,
          letterSpacing: 1,
        ),
      ),
    ),
  );
}
