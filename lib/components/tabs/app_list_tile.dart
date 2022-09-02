import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/item.dart';

class AppListTile extends ConsumerWidget {
  const AppListTile(this.item, {Key? key}) : super(key: key);

  final Item item;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CheckboxListTile(
      value: item.hasBought,
      onChanged: (bool? value) {},
      title: Text(
        item.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: item.memo == null
          ? null
          : Text(item.memo!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12)),
      secondary: Icon(
        item.isStarred ? Icons.star : Icons.star_outline,
        color: Colors.blueAccent,
      ),
      controlAffinity: ListTileControlAffinity.leading,
      checkboxShape: const CircleBorder(),
    );
  }
}
