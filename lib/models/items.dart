import 'package:freezed_annotation/freezed_annotation.dart';

import 'item.dart';

part 'items.freezed.dart';
part 'items.g.dart';

@freezed
class Items with _$Items {
  const factory Items(
      {@Default('') String id,
      @Default('') String title,
      @Default(<Item>[]) List<Item> items}) = _Items;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
}
