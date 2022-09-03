// ignore_for_file: type=lint
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/default_item_list.dart';
import '../../controllers/item/itemlist_controller.dart';
import '../../models/item.dart';
import '../../models/item_list.dart';
import 'itemlists_provider.dart';

final itemListProvider =
    StateNotifierProviderFamily<ItemListController, ItemList, ItemList>(
        (ref, arg) => ItemListController(arg, ref));

final starredItemListProvider =
    StateNotifierProvider<ItemListController, ItemList>((ref) {
  final itemLists = ref.watch(itemListsProvider);
  if (itemLists.loading) {
    return ItemListController(starredItems, ref);
  }

  final items = <Item>[];
  for (ItemList itemList in itemLists.itemLists) {
    final starredItems =
        itemList.items.where((Item item) => item.isStarred).toList();
    items.addAll(starredItems);
  }

  return ItemListController(starredItems.copyWith(items: items), ref);
});

final currentTabItemListProvider = StateProvider<ItemList>((ref) => shoppingList);
