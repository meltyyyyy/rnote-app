import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'label_annotation.dart';
import 'localized_object_annotation.dart';

part 'annotated_response.g.dart';

///Individual responses to image annotation requests within the batch.
@JsonSerializable(explicitToJson: true)
class AnnotatedResponse {

  AnnotatedResponse(
      {this.localizedObjectAnnotationList, this.labelAnnotationList});

  factory AnnotatedResponse.fromJson(Map<String, dynamic> json) =>
      _$AnnotatedResponseFromJson(json);

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

  Map<String, dynamic> toJson() => _$AnnotatedResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
