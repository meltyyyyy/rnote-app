import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'text_detection_params.dart';

part 'image_context.g.dart';

///Individual image annotation requests for this batch.
@JsonSerializable(explicitToJson: true)
class ImageContext {
  ///Aspect ratios in floats, representing the ratio of the width to the height
  ///of the image. For example, if the desired aspect ratio is 4/3, the
  ///corresponding float value should be 1.33333. If not specified, the best
  ///possible crop is returned. The number of provided aspect ratios is limited
  ///to a maximum of 16; any aspect ratios provided after the 16th are ignored.
  final List<String>? languageHints;

  ///Parameters for text detection and document text detection.
  final TextDetectionParams? textDetectionParams;

  ImageContext(
      {this.languageHints,
        this.textDetectionParams});

  factory ImageContext.fromJson(Map<String, dynamic> json) =>
      _$ImageContextFromJson(json);

  Map<String, dynamic> toJson() => _$ImageContextToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
