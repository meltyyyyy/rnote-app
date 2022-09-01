// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      itemListId: json['itemListId'] as String? ?? '',
      quantity: json['quantity'] as int?,
      memo: json['memo'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      hasBought: json['hasBought'] as bool? ?? false,
      isStarred: json['isStarred'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'itemListId': instance.itemListId,
      'quantity': instance.quantity,
      'memo': instance.memo,
      'date': instance.date?.toIso8601String(),
      'hasBought': instance.hasBought,
      'isStarred': instance.isStarred,
    };
