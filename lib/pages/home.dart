import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rnote'),
      ),
      body: const Center(
        child: Text('Center'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.orangeAccent,
        selectedLabelStyle: const TextStyle(color: Colors.orangeAccent),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home, color: Colors.orangeAccent),
              label: 'home',
              tooltip: 'ホーム画面'),
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              activeIcon: Icon(Icons.set_meal, color: Colors.orangeAccent),
              label: 'recipe',
              tooltip: 'レシピ'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              activeIcon: Icon(Icons.person, color: Colors.orangeAccent),
              label: 'mypage',
              tooltip: 'マイページ'),
        ],
      ),
    );
  }
}
