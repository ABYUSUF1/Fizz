class FeaturedImage {
  String? id;
  String? url;

  FeaturedImage({this.id, this.url});

  factory FeaturedImage.fromJson(Map<String, dynamic> json) => FeaturedImage(
        id: json['id'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
      };
}
