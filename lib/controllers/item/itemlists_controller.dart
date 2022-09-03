import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:uuid/uuid.dart';
import '../../models/item.dart';
import '../../models/item_list.dart';
import '../../models/item_lists.dart';
import '../../models/user.dart';
import '../../providers/firebase/firestore_provider.dart';
import '../../providers/user_ptovider.dart';
import '../firebase/firestore_controller.dart';
import '../user_controller.dart';

class ItemListsController extends StateNotifier<ItemLists> {
  ItemListsController(this._ref) : super(const ItemLists()) {
    init();
    fetchItemLists();
  }

  final Ref _ref;

  Future<void> init() async {
    final FirestoreController storeCtl = _ref.read(storeProvider);
    final UserController userCtl = _ref.read(userProvider.notifier);
    // Wait until User is updated
    userCtl.init().then((_) => storeCtl.initItemList());
  }

  Future<void> fetchItemLists() async {
    final FirestoreController storeCtl = _ref.read(storeProvider);

    final List<ItemList> itemLists = await storeCtl.fetchItemLists();
    state = state.copyWith(itemLists: itemLists, loading: false);
  }

  void createNewList(String title) {
    final FirestoreController storeCtl = _ref.read(storeProvider);
    final User user = _ref.read(userProvider);

    const Uuid uuid = Uuid();
    final ItemList itemList =
        ItemList(id: uuid.v1(), title: title, userId: user.id);

    storeCtl.setItemList(itemList);
    state = state.copyWith(itemLists: <ItemList>[...state.itemLists, itemList]);
  }

  // Add new Item to corresponding ItemList
  void addNewItem(Item item) {
    final List<ItemList> itemLists = state.itemLists;
    final List<ItemList> newItemLists = itemLists.map((ItemList e) {
      if (e.id == item.itemListId) {
        e = e.copyWith(items: <Item>[item, ...e.items]);
      }
      return e;
    }).toList();

    state = state.copyWith(itemLists: newItemLists);
  }
}
