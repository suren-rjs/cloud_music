import 'package:flutter/material.dart';
import 'package:cloud_music/views/list_of_songs.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cloud Music',
        home: ListSongsView());
  }
}
