import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../models/item.dart';
import '../../models/item_list.dart';
import '../../models/user.dart';
import '../../providers/firebase/firestore_provider.dart';
import '../../providers/item/itemlists_provider.dart';
import '../../providers/user_ptovider.dart';
import '../firebase/firestore_controller.dart';
import 'itemlists_controller.dart';

class ItemListController extends StateNotifier<ItemList> {
  ItemListController(super.state, this._ref);

  final Ref _ref;

  void createNewItem(String name, String itemListId,
      {required bool isStarred, int? quantity, String? memo, String? date}) {
    final FirestoreController storeCtl = _ref.read(storeProvider);
    final User user = _ref.read(userProvider);

    const Uuid uuid = Uuid();
    final Item item = Item(
        id: uuid.v1(),
        name: name,
        itemListId: itemListId,
        userId: user.id,
        quantity: quantity,
        memo: memo,
        date: date,
        isStarred: isStarred);

    storeCtl.setItem(item);
    addItem(item);
  }

  void addItem(Item item) {
    final ItemListsController itemListsCtl =
        _ref.read(itemListsProvider.notifier);
    state = state.copyWith(items: <Item>[item, ...state.items]);
    itemListsCtl.addNewItem(item);
  }
}
