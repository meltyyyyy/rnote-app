import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'feature.dart';
import 'image.dart';
import 'image_context.dart';

part 'annotation_request.g.dart';

///Individual image annotation requests for this batch.
@JsonSerializable()
class AnnotationRequest {
  AnnotationRequest(
      {required this.image, required this.features, this.imageContext});

  factory AnnotationRequest.fromJson(Map<String, dynamic> json) =>
      _$AnnotationRequestFromJson(json);

  ///The image to be processed.
  final Image image;

  ///Requested features.
  final List<Feature> features;

  ///Additional context that may accompany the image.
  final ImageContext? imageContext;

  Map<String, dynamic> toJson() => _$AnnotationRequestToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
