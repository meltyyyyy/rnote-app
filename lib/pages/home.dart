import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/bottom_tab_index.dart';
import '../providers/bottom_tab_index.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int bottomTabIndex = ref.watch(bottomTabIndexProvider);
    final StateController<int> bottomTabIndexCtl =
        ref.watch(bottomTabIndexProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rnote'),
      ),
      body: const Center(
        child: Text('Center'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomTabIndex,
        selectedItemColor: Colors.orangeAccent,
        selectedLabelStyle: const TextStyle(color: Colors.orangeAccent),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home),
              label: 'home',
              tooltip: 'ホーム画面'),
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              activeIcon: Icon(Icons.set_meal),
              label: 'recipe',
              tooltip: 'レシピ'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              activeIcon: Icon(Icons.person),
              label: 'mypage',
              tooltip: 'マイページ'),
        ],
      ),
    );
  }
}
