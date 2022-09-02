import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/tabs/app_list_tile.dart';
import '../../components/tabs/shimmer_list_tile.dart';
import '../../models/item_list.dart';
import '../../models/item_lists.dart';
import '../../providers/item/itemlist_list_provider.dart';
import '../../providers/item/itemlist_provider.dart';

class StarredItemsTab extends HookConsumerWidget {
  const StarredItemsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ItemLists itemLists = ref.watch(itemListsProvider);
    final ItemList starredItems = ref.watch(starredItemListProvider);

    return RefreshIndicator(
        child: ListView.builder(
            itemCount: itemLists.loading ? 10 : starredItems.items.length,
            itemBuilder: (BuildContext context, int index) {
              return itemLists.loading
                  ? const ShimmerListTile()
                  : AppListTile(starredItems.items[index]);
            }),
        onRefresh: () => Future<void>.delayed(const Duration(seconds: 1)));
  }
}
