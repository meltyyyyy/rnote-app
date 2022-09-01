import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/item_list.dart';

class ItemListController extends StateNotifier<ItemList> {
  ItemListController(this._ref) : super(const ItemList());

  final Ref _ref;
}
