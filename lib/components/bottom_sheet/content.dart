import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controllers/item/itemlist_controller.dart';
import '../../models/item_list.dart';
import '../../providers/item/itemlist_provider.dart';
import '../app_calendar.dart';
import '../date_bubble.dart';

class BottomSheetContent extends HookConsumerWidget {
  const BottomSheetContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ItemList currentTabItemList = ref.watch(currentTabItemListProvider);
    final ItemListController itemListCtl =
        ref.watch(itemListProvider(currentTabItemList).notifier);

    final TextEditingController _nameCtl = useTextEditingController(text: '');
    final TextEditingController _numCtl = useTextEditingController(text: '');
    final TextEditingController _memoCtl = useTextEditingController(text: '');
    final ValueNotifier<String> _name = useState<String>('');
    final ValueNotifier<String?> _memo = useState<String?>(null);
    final ValueNotifier<bool> _isStarred = useState<bool>(false);
    final ValueNotifier<bool> _addMemo = useState<bool>(false);
    final ValueNotifier<DateTime?> _date = useState<DateTime?>(null);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _nameCtl,
          onChanged: (String text) => _name.value = text,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'New item',
            border: InputBorder.none,
          ),
        ),
        if (_addMemo.value) ...<Widget>[
          TextField(
            controller: _memoCtl,
            onChanged: (String text) => _memo.value = text,
            autofocus: false,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
            decoration: const InputDecoration(
              hintText: 'Add memo',
              hintStyle: TextStyle(fontSize: 14),
              border: InputBorder.none,
            ),
          ),
        ],
        Container(
          margin: const EdgeInsets.only(bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              if (_date.value != null) ...<Widget>[
                DateBubble(
                  date: _date.value!,
                  onTap: () => _date.value = null,
                  isRemovable: true,
                )
              ],
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  onTap: () => _addMemo.value = true,
                  child: const Icon(Icons.menu_open,
                      size: 24, color: Colors.blueAccent),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () => AppCalendar.show(context)
                      .then((DateTime? date) => _date.value = date),
                  child: const Icon(Icons.edit_calendar_rounded,
                      size: 24, color: Colors.blueAccent),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () => _isStarred.value = !_isStarred.value,
                  child: Icon(
                      _isStarred.value ? Icons.star : Icons.star_outline,
                      size: 24,
                      color: Colors.blueAccent),
                ),
              ],
            ),
            GestureDetector(
                onTap: () {
                  if (_nameCtl.text.isEmpty) {
                    return;
                  }
                  itemListCtl.createNewItem(
                      _nameCtl.text, currentTabItemList.id,
                      memo: _memo.value,
                      quantity: int.tryParse(_numCtl.text),
                      date: _date.value?.toString(),
                      isStarred: _isStarred.value);
                  Navigator.pop(context);
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                      color: _name.value.isEmpty
                          ? Colors.black54
                          : Colors.blueAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ))
          ],
        )
      ],
    );
  }
}
