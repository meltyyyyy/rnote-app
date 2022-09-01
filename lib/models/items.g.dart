// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Items _$$_ItemsFromJson(Map<String, dynamic> json) => _$_Items(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Item>[],
    );

Map<String, dynamic> _$$_ItemsToJson(_$_Items instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
