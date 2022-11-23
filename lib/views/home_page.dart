import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_music/views/list_of_songs.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import '../services/api-service/spotify_api.dart';
import '../services/handles/hanlde_natives.dart';
import 'controller/playlist_manager.dart';
import 'custom/bottom_player.dart';
import 'custom/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Locale _locale = const Locale('en', '');
  late StreamSubscription _intentDataStreamSubscription;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void dispose() {
    _intentDataStreamSubscription.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final Map<String, String> codes = {
      'Chinese': 'zh',
      'Czech': 'cs',
      'Dutch': 'nl',
      'English': 'en',
      'French': 'fr',
      'German': 'de',
      'Hebrew': 'he',
      'Hindi': 'hi',
      'Hungarian': 'hu',
      'Indonesian': 'id',
      'Italian': 'it',
      'Polish': 'pl',
      'Portuguese': 'pt',
      'Russian': 'ru',
      'Spanish': 'es',
      'Tamil': 'ta',
      'Turkish': 'tr',
      'Ukrainian': 'uk',
      'Urdu': 'ur',
    };
    final String systemLangCode = Platform.localeName.substring(0, 2);
    if (codes.values.contains(systemLangCode)) {
      _locale = Locale(systemLangCode);
    } else {
      final String lang =
          Hive.box('settings').get('lang', defaultValue: 'English') as String;
      _locale = Locale(codes[lang]!);
    }

    // For sharing or opening urls/text coming from outside the app while the app is in the memory
    _intentDataStreamSubscription = ReceiveSharingIntent.getTextStream().listen(
      (String value) {
        handleSharedText(value, navigatorKey);
      },
      onError: (err) {
        // print("ERROR in getTextStream: $err");
      },
    );

    // For sharing or opening urls/text coming from outside the app while the app is closed
    ReceiveSharingIntent.getInitialText().then(
      (String? value) {
        if (value != null) handleSharedText(value, navigatorKey);
      },
    );
  }

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    List preferredLanguage = Hive.box('settings').get('preferredLanguage',
        defaultValue: ['English', 'Tamil'])?.toList() as List;
    String region =
        Hive.box('settings').get('region', defaultValue: 'India') as String;
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
        const PlayList(),
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
            builder: (context) => SongsList(
              playlistName: title,
              playlistId: '',
            ),
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
}
