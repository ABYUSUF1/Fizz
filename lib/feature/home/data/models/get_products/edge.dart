import 'node.dart';

class Edge {
  Node? node;

  Edge({this.node});

  factory Edge.fromJson(Map<String, dynamic> json) => Edge(
        node: json['node'] == null
            ? null
            : Node.fromJson(json['node'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'node': node?.toJson(),
      };
}
