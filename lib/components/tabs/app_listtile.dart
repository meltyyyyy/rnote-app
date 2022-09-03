import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../models/item.dart';
import '../date_bubble.dart';

class AppListTile extends ConsumerWidget {
  const AppListTile(this.item, {Key? key}) : super(key: key);

  final Item item;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CheckboxListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      value: item.hasBought,
      onChanged: (bool? value) {},
      title: Text(
        item.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: _buildSubtitle(item),
      secondary: Icon(
        item.isStarred ? Icons.star : Icons.star_outline,
        color: Colors.blueAccent,
      ),
      controlAffinity: ListTileControlAffinity.leading,
      checkboxShape: const CircleBorder(),
    );
  }

  Widget _buildSubtitle(Item item){
    final String? memo = item.memo;
    final String? date = item.date;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if(memo != null && memo.isNotEmpty)...<Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Text(item.memo!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12)),
          )
        ],
        if(date != null)...<Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: DateBubble(date: DateFormat('y-M-d').parse(date)),
          )
        ]
      ],
    );
  }
}
