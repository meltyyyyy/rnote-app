import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/bottom_tab_index.dart';
import '../providers/bottom_sheet_state_provider.dart';
import '../providers/bottom_tab_index_provider.dart';
import 'mypage/mypage.dart';
import 'note/note.dart';
import 'recipes/recipes.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int bottomTabIndex = ref.watch(bottomTabIndexProvider);
    final StateController<bool> bottomSheetStateCtl =
        ref.watch(bottomSheetStateProvider.notifier);
    final StateController<int> bottomTabIndexCtl =
        ref.watch(bottomTabIndexProvider.notifier);

    Widget _body(int index) {
      switch (index) {
        case BottomTabIndex.note:
          return const Note();
        case BottomTabIndex.recipes:
          return const Recipes();
        case BottomTabIndex.mypage:
          return const MyPage();
        default:
          return const SizedBox.shrink();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rnote'),
        leading: GestureDetector(
          onTap: () {
            bottomSheetStateCtl.update((_) => true);
          },
          child: const Icon(Icons.upload),
        ),
      ),
      body: _body(bottomTabIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomTabIndex,
        onTap: (int index) => bottomTabIndexCtl.update((_) => index),
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
