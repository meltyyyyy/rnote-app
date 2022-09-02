import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/tabs/app_list_tile.dart';
import '../../components/tabs/shimmer_list_tile.dart';
import '../../models/item.dart';

class StarredItemsTab extends HookConsumerWidget {
  const StarredItemsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Item> items = <Item>[];
    for (int i = 0; i < 20; i++) {
      items.add(Item(
        id: '$i',
        name: 'アイテム$i',
        memo: 'メモメモ',
        isStarred: true,
      ));
    }

    return RefreshIndicator(
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return const ShimmerListTile();
            }),
        onRefresh: () => Future<void>.delayed(const Duration(seconds: 1)));
  }
}
