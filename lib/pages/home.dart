import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rnote_app/pages/tabs/item_list_tab.dart';

import '../components/bottom_sheet/app_bottomsheet.dart';
import '../constants/app_color.dart';
import '../constants/default_item_list.dart';
import '../constants/tab_index.dart';
import '../models/item_list.dart';
import '../models/item_lists.dart';
import '../providers/item/itemlist_provider.dart';
import '../providers/item/itemlists_provider.dart';
import 'tabs/new_list_tab.dart';
import 'tabs/starred_items_tab.dart';

class Home extends HookConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ItemLists itemLists = ref.watch(itemListsProvider);

    final List<Tab> _tabs = <Tab>[
      const Tab(icon: Icon(Icons.star)),
      const Tab(text: '買い出しリスト'),
    ];

    for (ItemList itemList in itemLists.itemLists) {
      _tabs.add(Tab(text: itemList.title));
    }

    return DefaultTabController(
        length: _tabs.length,
        initialIndex: TabIndex.shopping,
        child: Builder(
          builder: (BuildContext context) => Scaffold(
            appBar: AppBar(
              title: const Text(
                'Rnote',
                style: TextStyle(color: Colors.black),
              ),
              leading: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                        builder: (_) => const NewListTab())),
                color: Colors.blueAccent,
              ),
              centerTitle: true,
              elevation: 1,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
              bottom: TabBar(
                tabs: _tabs,
                labelColor: Colors.blueAccent,
                indicatorColor: Colors.blueAccent,
                unselectedLabelColor: Colors.black54,
                isScrollable: true,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                onTap: (int index) =>
                    ref.read(currentTabItemListProvider.notifier).update((_) {
                  if (index == TabIndex.starred) {
                    return starredItems;
                  }
                  if (index == TabIndex.shopping) {
                    return shoppingList;
                  }
                  return itemLists.itemLists[index - 2];
                }),
              ),
            ),
            body: TabBarView(
              children: _tabs
                  .asMap()
                  .map((int index, _) {
                    // starred tab
                    if (index == TabIndex.starred) {
                      return MapEntry<int, Widget>(
                          index, const StarredItemsTab());
                    }
                    // shopping list tab
                    if (index == TabIndex.shopping) {
                      return MapEntry<int, Widget>(
                          index, ItemListTab(shoppingList));
                    }
                    // others
                    return MapEntry<int, Widget>(
                        index, ItemListTab(itemLists.itemLists[index - 2]));
                  })
                  .values
                  .toList(),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () => AppBottomSheet.show(context),
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.add,
                  color: AppColor.normalButton,
                  size: 32,
                )),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const AppBottomSheet(),
          ),
        ));
  }
}
