import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  const factory Item(
      {@Default('') String id,
      @Default('') String name,
      @Default('') String itemListId,
      int? quantity,
      String? memo,
      DateTime? date,
      @Default(false) bool hasBought,
      @Default(false) bool isStarred}) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
