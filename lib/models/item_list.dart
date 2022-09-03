import 'package:freezed_annotation/freezed_annotation.dart';

import 'item.dart';

part 'item_list.freezed.dart';
part 'item_list.g.dart';

@freezed
class ItemList with _$ItemList {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ItemList(
      {@Default('') String id,
      @Default('') String title,
      @Default('') String userId,
      @Default(<Item>[]) List<Item> items,
      @Default('') String createdAt}) = _ItemList;

  factory ItemList.fromJson(Map<String, dynamic> json) =>
      _$ItemListFromJson(json);
}
