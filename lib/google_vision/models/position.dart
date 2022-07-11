import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'position.g.dart';

///A 3D position in the image, used primarily for Face detection landmarks. A
///valid Position must have both x and y coordinates. The position coordinates
///are in the same scale as the original image.
@JsonSerializable()
class Position {
  Position({required this.x, required this.y, required this.z});

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);

  ///X coordinate.
  final double x;

  ///Y coordinate.
  final double y;

  ///Z coordinate (or depth).
  final double z;

  Map<String, dynamic> toJson() => _$PositionToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
