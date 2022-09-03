import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:uuid/uuid.dart';
import '../../models/item.dart';
import '../../models/item_list.dart';
import '../../models/item_lists.dart';
import '../../providers/firebase/firestore_provider.dart';
import '../firebase/firestore_controller.dart';

class ItemListsController extends StateNotifier<ItemLists> {
  ItemListsController(this._ref) : super(const ItemLists()) {
    fetchItemLists();
  }

  final Ref _ref;

  Future<void> fetchItemLists() async {
    final FirestoreController storeCtl = _ref.read(storeProvider);

    final List<ItemList> itemLists = await storeCtl.fetchItemLists();
    state = state.copyWith(itemLists: itemLists, loading: false);
  }

  void createNewList(String title) {
    final FirestoreController storeCtl = _ref.read(storeProvider);

    const Uuid uuid = Uuid();
    final ItemList itemList = ItemList(id: uuid.v1(), title: title);

    storeCtl.setItemList(itemList);
    state = state.copyWith(itemLists: <ItemList>[...state.itemLists, itemList]);
  }

  // Add new Item to corresponding ItemList
  void addNewItem(Item item) {
    final List<ItemList> itemLists = state.itemLists;
    final List<ItemList> newItemLists = itemLists.map((ItemList e) {
      if(e.id == item.itemListId){
        e = e.copyWith(items: <Item>[item, ...e.items]);
      }
      return e;
    }).toList();

    state = state.copyWith(itemLists: newItemLists);
  }
}
