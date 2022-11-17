class Song {
  String songName;
  String artist;
  String imageSong;
  bool isUserFavourite;

  getSongName() {
    return songName;
  }

  Song(
      {required this.songName,
      required this.artist,
      required this.imageSong,
      required this.isUserFavourite});
}

List<Song> songsTest = [
  Song(
      songName: "Rocket Queen",
      artist: "Guns N Roses",
      imageSong: "https://i.imgur.com/I1i8ZDR.jpg",
      isUserFavourite: false),
  Song(
      songName: "Evolve",
      artist: "The Warning",
      imageSong: "https://i.imgur.com/Ks76XVS.jpg",
      isUserFavourite: true),
  Song(
      songName: "Don't Start Now",
      artist: "Dua Lipa",
      imageSong: "https://i.imgur.com/JIfYcPC.jpg",
      isUserFavourite: false),
  Song(
      songName: "Robot Rock",
      artist: "Daft Punk",
      imageSong: "https://i.imgur.com/gydhry7.jpg",
      isUserFavourite: false),
  Song(
      songName: "Californication",
      artist: "Red Hot Chilli Peppers",
      imageSong: "https://i.imgur.com/5DBSkct.jpg",
      isUserFavourite: false),
  Song(
      songName: "Friends Are Family",
      artist: "Oh, Hush!",
      imageSong: "https://i.imgur.com/fLrttSC.jpg",
      isUserFavourite: false),
  Song(
      songName: "Binary Star",
      artist: "SawanoHiroyuki",
      imageSong: "https://i.imgur.com/E3YE7Cs.jpg",
      isUserFavourite: false),
  Song(
      songName: "Rocket Queen",
      artist: "Guns N Roses",
      imageSong: "https://i.imgur.com/I1i8ZDR.jpg",
      isUserFavourite: false),
  Song(
      songName: "Evolve",
      artist: "The Warning",
      imageSong: "https://i.imgur.com/Ks76XVS.jpg",
      isUserFavourite: false),
  Song(
      songName: "Don't Start Now",
      artist: "Dua Lipa",
      imageSong: "https://i.imgur.com/JIfYcPC.jpg",
      isUserFavourite: false),
  Song(
      songName: "Robot Rock",
      artist: "Daft Punk",
      imageSong: "https://i.imgur.com/gydhry7.jpg",
      isUserFavourite: false),
  Song(
      songName: "Californication",
      artist: "Red Hot Chilli Peppers",
      imageSong: "https://i.imgur.com/5DBSkct.jpg",
      isUserFavourite: false),
  Song(
      songName: "Friends Are Family",
      artist: "Oh, Hush!",
      imageSong: "https://i.imgur.com/fLrttSC.jpg",
      isUserFavourite: false),
  Song(
      songName: "Binary Star",
      artist: "SawanoHiroyuki",
      imageSong: "https://i.imgur.com/E3YE7Cs.jpg",
      isUserFavourite: false)
];
