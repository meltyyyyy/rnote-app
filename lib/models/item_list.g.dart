// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemList _$$_ItemListFromJson(Map<String, dynamic> json) => _$_ItemList(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Item>[],
      createdAt: json['created_at'] as String? ?? '',
    );

Map<String, dynamic> _$$_ItemListToJson(_$_ItemList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'user_id': instance.userId,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt,
    };
