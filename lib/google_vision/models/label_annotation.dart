import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'label_annotation.g.dart';

///Set of detected labels
@JsonSerializable()
class LabelAnnotation {

  LabelAnnotation(
      {required this.mid,
        required this.description,
        required this.score,
        required this.topicality});

  factory LabelAnnotation.fromJson(Map<String, dynamic> json) =>
      _$LabelAnnotationFromJson(json);
  ///Object ID that should align with EntityAnnotation mid.
  final String mid;

  ///The label itself
  final String description;

  ///Score of the result. Range [0, 1].
  final double score;

  ///Topicality of the result. Range [0, 1].
  final double topicality;

  Map<String, dynamic> toJson() => _$LabelAnnotationToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
