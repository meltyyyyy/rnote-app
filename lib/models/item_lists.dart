import 'package:freezed_annotation/freezed_annotation.dart';

import 'item_list.dart';

part 'item_lists.freezed.dart';

@freezed
class ItemLists with _$ItemLists {
  const factory ItemLists(
      {@Default(<ItemList>[]) List<ItemList> itemLists,
      @Default(true) bool loading}) = _ItemLists;
}
