import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Item(
      {@Default('') String id,
      @Default('') String name,
      @Default('') String itemListId,
      int? quantity,
      String? memo,
      String? date,
      @Default(false) bool hasBought,
      @Default(false) bool isStarred,
      @Default('') String createdAt,
      String? updatedAt}) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
