import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controllers/item/itemlist_list_controller.dart';
import '../../providers/item/itemlist_list_provider.dart';

class NewListTab extends HookConsumerWidget {
  const NewListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ItemListListController itemListListCtl =
        ref.watch(itemListListProvider.notifier);
    final TextEditingController _titleCtl = useTextEditingController(text: '');
    final FocusNode _focusNode = FocusNode();

    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black54,
            ),
          ),
          title: const Text(
            'Create new list',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          centerTitle: true,
          elevation: 1,
          backgroundColor: Colors.white,
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  if (_titleCtl.text.isEmpty) {
                    return;
                  }
                  itemListListCtl.createNewList(_titleCtl.text);
                },
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: Text(
                  'Done',
                  style: TextStyle(
                      color: _titleCtl.text.isEmpty
                          ? Colors.black54
                          : Colors.black,
                      fontSize: 16),
                ))
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: TextField(
                controller: _titleCtl,
                focusNode: _focusNode,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Enter list title',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () => _focusNode.unfocus(),
          child: Container(
            color: Colors.transparent,
          ),
        ));
  }
}
