import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/app_bottomsheet.dart';
import '../constants/app_color.dart';
import '../controllers/item/itemlists_controller.dart';
import '../models/item_list.dart';
import '../models/item_lists.dart';
import '../providers/item/itemlist_list_provider.dart';
import 'tabs/new_list_tab.dart';
import 'tabs/starred_items_tab.dart';

class Home extends HookConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ItemListsController itemListsCtl =
        ref.watch(itemListsProvider.notifier);
    final ItemLists itemLists = ref.watch(itemListsProvider);

    if (itemLists.loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final TabController _tabCtl =
        useTabController(initialLength: 2 + itemLists.itemLists.length);
    final List<Tab> _tabs = <Tab>[
      const Tab(icon: Icon(Icons.star)),
      const Tab(text: '買い出しリスト'),
    ];

    for (ItemList itemList in itemLists.itemLists) {
      _tabs.add(Tab(text: itemList.title));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rnote',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute<void>(builder: (_) => NewListTab())),
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
          controller: _tabCtl,
        ),
      ),
      body: TabBarView(
        controller: _tabCtl,
        children: _tabs
            .asMap()
            .map((int index, _) {
              if (index == 0) {
                return MapEntry<int, Widget>(index, const StarredItemsTab());
              }
              return MapEntry<int, Widget>(index, const SizedBox());
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
    );
  }
}
