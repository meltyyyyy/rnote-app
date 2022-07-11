import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'label_annotation.dart';
import 'localized_object_annotation.dart';

part 'annotate_image_response.g.dart';

///Individual responses to image annotation requests within the batch.
@JsonSerializable(explicitToJson: true)
class AnnotateImageResponse {

  AnnotateImageResponse(
      {this.localizedObjectAnnotationList, this.labelAnnotationList});

  factory AnnotateImageResponse.fromJson(Map<String, dynamic> json) =>
      _$AnnotateImageResponseFromJson(json);

  @JsonKey(name: 'localizedObjectAnnotations')
  final List<LocalizedObjectAnnotation>? localizedObjectAnnotationList;

  @JsonKey(name: 'labelAnnotations')
  final List<LabelAnnotation>? labelAnnotationList;

  ///If present, landmark detection has completed successfully.
  List<LocalizedObjectAnnotation> get localizedObjectAnnotations =>
      localizedObjectAnnotationList ?? <LocalizedObjectAnnotation>[];

  ///If present, label  detection has completed successfully.
  List<LabelAnnotation> get labelAnnotations =>
      labelAnnotationList ?? <LabelAnnotation>[];

  Map<String, dynamic> toJson() => _$AnnotateImageResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
