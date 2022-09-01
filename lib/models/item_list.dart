import 'package:freezed_annotation/freezed_annotation.dart';

import 'item.dart';

part 'item_list.freezed.dart';
part 'item_list.g.dart';

@freezed
class ItemList with _$ItemList {
  const factory ItemList(
      {@Default('') String id,
      @Default('') String title,
      @Default(<Item>[]) List<Item> items}) = _ItemList;

  factory ItemList.fromJson(Map<String, dynamic> json) =>
      _$ItemListFromJson(json);
}
