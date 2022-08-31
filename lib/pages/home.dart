import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/app_bottomsheet.dart';
import '../components/app_divider.dart';
import '../components/app_text.dart';
import '../components/app_textbutton.dart';
import '../constants/app_color.dart';
import 'note/note.dart';

class Home extends HookConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _tabCtl = useTabController(initialLength: 10);

    List<Tab> _tabs = <Tab>[
      Tab(text: '08/28'),
      Tab(text: '09/01'),
      Tab(text: '02/42'),
      Tab(text: '08/29'),
      Tab(text: '09/02'),
      Tab(text: '02/24'),
      Tab(text: '02/24'),
      Tab(text: '08/21'),
      Tab(text: '09/12'),
      Tab(text: '02/31'),
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
        children: _tabs,
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
      bottomNavigationBar: AppBottomSheet(),
    );
  }
}
