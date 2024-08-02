import 'featured_image.dart';
import 'variants.dart';

class GetProducts {
  String? id;
  String? title;
  String? description;
  FeaturedImage? featuredImage;
  Variants? variants;

  GetProducts({
    this.id,
    this.title,
    this.description,
    this.featuredImage,
    this.variants,
  });

  factory GetProducts.fromJson(Map<String, dynamic> json) => GetProducts(
        id: json['id'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        featuredImage: json['featuredImage'] == null
            ? null
            : FeaturedImage.fromJson(
                json['featuredImage'] as Map<String, dynamic>),
        variants: json['variants'] == null
            ? null
            : Variants.fromJson(json['variants'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'featuredImage': featuredImage?.toJson(),
        'variants': variants?.toJson(),
      };
}
