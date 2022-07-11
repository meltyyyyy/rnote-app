// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageContext _$ImageContextFromJson(Map<String, dynamic> json) => ImageContext(
      languageHints: (json['languageHints'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      textDetectionParams: json['textDetectionParams'] == null
          ? null
          : TextDetectionParams.fromJson(
              json['textDetectionParams'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageContextToJson(ImageContext instance) =>
    <String, dynamic>{
      'languageHints': instance.languageHints,
      'textDetectionParams': instance.textDetectionParams?.toJson(),
    };
