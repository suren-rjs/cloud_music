import 'package:cloud_music/views/list_of_songs.dart';
import 'package:flutter/material.dart';

import 'custom/bottom_player.dart';
import 'custom/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x794a4a4a),
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              homeWidgets(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomPlayer(isPlayeListScreen: true),
    );
  }

  Widget homeWidgets(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "My Favours",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 20,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 50,
          child: ListView.builder(
            itemCount: 20,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 10, right: 10),
            itemBuilder: (context, index) {
              return favouriteChip(index, "https://i.imgur.com/5DBSkct.jpg");
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "Based On Your Listening",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 170,
          child: ListView.builder(
            itemCount: 20,
            padding: const EdgeInsets.only(left: 10, right: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return boxContainer(index, "https://i.imgur.com/I1i8ZDR.jpg",
                  "Based On Your Listening");
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "Recently Played",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 170,
          child: ListView.builder(
            itemCount: 20,
            padding: const EdgeInsets.only(left: 10, right: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return boxContainer(
                  index, "https://i.imgur.com/gydhry7.jpg", "Recently Played");
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "More of what you like",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 170,
          child: ListView.builder(
            itemCount: 20,
            padding: const EdgeInsets.only(left: 10, right: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return boxContainer(index, "https://i.imgur.com/Ks76XVS.jpg",
                  "More of what you like");
            },
          ),
        ),
      ],
    );
  }

  InkWell boxContainer(int index, String url, String title) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SongsList(playlistName: title),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              color: const Color(0xff2a2a2a),
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
                opacity: 0.85,
              ),
            ),
            margin: const EdgeInsets.all(3.5),
            alignment: Alignment.center,
          ),
          const SizedBox(height: 8),
          const Text(
            "Long Text Title",
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  InkWell favouriteChip(int index, String url) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SongsList(
              playlistName: 'Favourites',
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
}
