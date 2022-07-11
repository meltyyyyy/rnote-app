import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'normalized_vertex.g.dart';

///A vertex represents a 2D point in the image. NOTE: the vertex coordinates are
///in the same scale as the original image.
@JsonSerializable()
class NormalizedVertex {

  NormalizedVertex({required this.x, required this.y});

  factory NormalizedVertex.fromJson(Map<String, dynamic> json) =>
      _$NormalizedVertexFromJson(json);
  ///X coordinate.
  @JsonKey(defaultValue: 0.0)
  final double x;

  ///Y coordinate.
  @JsonKey(defaultValue: 0.0)
  final double y;

  Map<String, dynamic> toJson() => _$NormalizedVertexToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
