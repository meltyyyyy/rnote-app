import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:uuid/uuid.dart';
import '../../models/item_list.dart';
import '../../providers/firebase/firestore_provider.dart';
import '../firebase/firestore_controller.dart';

class ItemListListController extends StateNotifier<List<ItemList>> {
  ItemListListController(this._ref) : super(<ItemList>[]);

  final Ref _ref;

  void createNewList(String title) {
    final FirestoreController storeCtl = _ref.read(storeProvider);

    const Uuid uuid = Uuid();
    final ItemList itemList = ItemList(id: uuid.v1(), title: title);

    storeCtl.setItemList(itemList);
    add(itemList);
  }

  void add(ItemList itemList) {
    state = <ItemList>[...state, itemList];
  }
}
