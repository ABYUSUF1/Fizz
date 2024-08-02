class Image {
  String? id;
  String? url;

  Image({this.id, this.url});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json['id'],
      url: json['url'],
    );
  }
}
