class Image {
  Image({
    this.height,
    this.url,
    this.width,
  });

  dynamic height;
  dynamic url;
  dynamic width;

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        height: json["height"] ?? 0,
        url: json["url"],
        width: json["width"] ?? 0,
      );
}
