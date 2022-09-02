import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rnote_app/pages/tabs/item_list_tab.dart';

import '../components/app_bottomsheet.dart';
import '../constants/app_color.dart';
import '../constants/default_item_list.dart';
import '../models/item.dart';
import '../models/item_list.dart';
import '../models/item_lists.dart';
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
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Rnote',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute<void>(builder: (_) => const NewListTab())),
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
          ),
        ),
        body: TabBarView(
          children: _tabs
              .asMap()
              .map((int index, _) {
                // starred tab
                if (index == 0) {
                  return MapEntry<int, Widget>(index, const StarredItemsTab());
                }
                // shopping list tab
                if (index == 1){
                  return MapEntry<int, Widget>(index, ItemListTab(shoppingList));
                }
                // others
                return MapEntry<int, Widget>(index, ItemListTab(itemLists.itemLists[index - 2]));
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const AppBottomSheet(),
      ),
    );
  }
}
