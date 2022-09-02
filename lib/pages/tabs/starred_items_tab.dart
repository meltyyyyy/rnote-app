import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
        isStarred: true,
      ));
    }

    return RefreshIndicator(
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return CheckboxListTile(
                value: items[index].hasBought,
                onChanged: (bool? value) {},
                title: Text(items[index].name),
              );
            }),
        onRefresh: () => Future<void>.delayed(const Duration(seconds: 1)));
  }
}
