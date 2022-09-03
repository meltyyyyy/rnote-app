// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      itemListId: json['item_list_id'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      quantity: json['quantity'] as int?,
      memo: json['memo'] as String?,
      date: json['date'] as String?,
      hasBought: json['has_bought'] as bool? ?? false,
      isStarred: json['is_starred'] as bool? ?? false,
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'item_list_id': instance.itemListId,
      'user_id': instance.userId,
      'quantity': instance.quantity,
      'memo': instance.memo,
      'date': instance.date,
      'has_bought': instance.hasBought,
      'is_starred': instance.isStarred,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
