import 'edge.dart';

class Variants {
  List<Edge>? edges;

  Variants({this.edges});

  factory Variants.fromJson(Map<String, dynamic> json) => Variants(
        edges: (json['edges'] as List<dynamic>?)
            ?.map((e) => Edge.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'edges': edges?.map((e) => e.toJson()).toList(),
      };
}
