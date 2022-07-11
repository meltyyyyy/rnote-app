// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnotatedResponse _$AnnotatedResponseFromJson(Map<String, dynamic> json) =>
    AnnotatedResponse(
      localizedObjectAnnotationList:
          (json['localizedObjectAnnotations'] as List<dynamic>?)
              ?.map((e) =>
                  LocalizedObjectAnnotation.fromJson(e as Map<String, dynamic>))
              .toList(),
      labelAnnotationList: (json['labelAnnotations'] as List<dynamic>?)
          ?.map((e) => LabelAnnotation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnnotatedResponseToJson(AnnotatedResponse instance) =>
    <String, dynamic>{
      'localizedObjectAnnotations': instance.localizedObjectAnnotationList
          ?.map((e) => e.toJson())
          .toList(),
      'labelAnnotations':
          instance.labelAnnotationList?.map((e) => e.toJson()).toList(),
    };
