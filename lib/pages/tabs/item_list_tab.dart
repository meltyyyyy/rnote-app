import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/tabs/app_list_tile.dart';
import '../../models/item_list.dart';
import '../../providers/item/itemlist_provider.dart';

class ItemListTab extends HookConsumerWidget {
  const ItemListTab(this.itemList, {Key? key}) : super(key: key);

  final ItemList itemList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ItemList itemList = ref.watch(itemListProvider(this.itemList));

    return RefreshIndicator(
        child: ListView.builder(
            itemCount: itemList.items.length,
            itemBuilder: (BuildContext context, int index) {
              return AppListTile(itemList.items[index]);
            }),
        onRefresh: () => Future<void>.delayed(const Duration(seconds: 1)));
  }
}
