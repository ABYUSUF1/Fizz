import 'image.dart';

class GetCollections {
  String? id;
  String? handle;
  String? title;
  String? description;
  Image? image;

  GetCollections(
      {this.id, this.handle, this.title, this.description, this.image});

  factory GetCollections.fromJson(Map<String, dynamic> json) {
    return GetCollections(
      id: json['id'],
      handle: json['handle'],
      title: json['title'],
      description: json['description'],
      image: Image.fromJson(json['image']),
    );
  }
}
