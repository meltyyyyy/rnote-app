import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'note/note.dart';

class Home extends HookConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _tabCtl = useTabController(initialLength: 3);

    List<Tab> _tabs = <Tab>[
      Tab(text: '08/28'),
      Tab(text: '09/01',),
      Tab(text: '02/42')
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rnote'),
        centerTitle: true,
        elevation: 1,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(5),
            child: Container(height: 1, color: Colors.green)
        ),
      ),
      body: Scaffold(
        appBar: AppBar(
          title: SizedBox(
            height: 32,
            child: TabBar(
              tabs: _tabs,
            isScrollable: true,
            controller: _tabCtl,),
          ),
        ),
        body: TabBarView(
            controller: _tabCtl,
            children: _tabs,
        ),
      )
    );
  }
}
