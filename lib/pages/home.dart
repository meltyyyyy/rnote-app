import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/app_bottomsheet.dart';
import '../constants/app_color.dart';
import 'tabs/new_list_tab.dart';
import 'tabs/starred_items_tab.dart';

class Home extends HookConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TabController _tabCtl = useTabController(initialLength: 2);
    final List<Tab> _tabs = <Tab>[
      Tab(icon: Icon(Icons.star)),
      Tab(text: '買い出しリスト'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rnote',
          style: TextStyle(color: Colors.black),
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
