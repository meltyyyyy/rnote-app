import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'annotated_response.dart';

part 'annotated_responses.g.dart';

///Response to a batch image annotation request.
@JsonSerializable(explicitToJson: true)
class AnnotatedResponses {

  AnnotatedResponses({
    required this.responses,
  });

  factory AnnotatedResponses.fromJson(Map<String, dynamic> json) =>
      _$AnnotatedResponsesFromJson(json);
  final List<AnnotatedResponse> responses;

  Map<String, dynamic> toJson() => _$AnnotatedResponsesToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
