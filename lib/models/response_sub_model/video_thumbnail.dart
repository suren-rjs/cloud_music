class VideoThumbnail {
  VideoThumbnail({
    required this.url,
  });

  dynamic url;

  factory VideoThumbnail.fromMap(Map<String, dynamic> json) => VideoThumbnail(
        url: json["url"],
      );
}
