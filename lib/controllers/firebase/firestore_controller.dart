import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/item.dart';
import '../../models/item_list.dart';
import '../../models/user.dart';
import '../../providers/firebase/auth_provider.dart';

class FirestoreController {
  FirestoreController(this._ref) : super();

  final Ref _ref;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<User> fetchCurrentUser() async {
    final String uid = _ref.read(authProvider.notifier).userId;

    // userId is '' when not logged in
    if (uid.isEmpty) {
      return const User();
    }

    final DocumentSnapshot<Map<String, dynamic>> userDoc =
        await _store.collection('user').doc(uid).get();
    assert(userDoc.data() != null, 'Firestore user/$uid is missing');
    final Map<String, dynamic> userJson =
        userDoc.data() ?? const User().toJson();
    return User.fromJson(userJson);
  }

  void setUser(User user) {
    final Map<String, dynamic> userJson = user.toJson();
    _store.collection('user').doc(user.id).set(userJson);
  }

  Future<List<ItemList>> fetchItemLists() async {
    final List<ItemList> itemLists = <ItemList>[];

    final QuerySnapshot<Map<String, dynamic>> itemListDoc =
        await _store.collection('itemList').get();
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshots =
        itemListDoc.docs;

    for (QueryDocumentSnapshot<Map<String, dynamic>> snapshot in snapshots) {
      final Map<String, dynamic> itemListJson = snapshot.data();

      // For Firestore, List<Item> items cannot be saved directly.
      // Save List<String> itemIds instead.
      assert(itemListJson.containsKey('items'),
          'Firestore itemList does not contain key items');
      final List<String> itemIds = itemListJson.containsKey('items')
          ? itemListJson['items'] as List<String>
          : <String>[];

      // For each itemIds, fetch actual item.
      final List<Item> items = <Item>[];
      for (String id in itemIds) {
        final DocumentSnapshot<Map<String, dynamic>> itemDoc =
            await _store.collection('items').doc(id).get();
        final Map<String, dynamic> itemJson =
            itemDoc.data() ?? const Item().toJson();
        items.add(Item.fromJson(itemJson));
      }

      // overwrite items property : List<String> -> List<Item>
      itemListJson['items'] = items;
      itemLists.add(ItemList.fromJson(itemListJson));
    }
    return itemLists;
  }

  Future<ItemList> fetchItemListById(String id) async {
    final DocumentSnapshot<Map<String, dynamic>> itemListDoc =
        await _store.collection('itemList').doc(id).get();
    assert(itemListDoc.data() != null, 'Firestore itemList/$id is missing');
    final Map<String, dynamic> itemListJson = itemListDoc.data() ?? const ItemList().toJson();
    final List<String> itemIds = itemListJson.containsKey('items')
        ? itemListJson['items'] as List<String>
        : <String>[];

    // For each itemIds, fetch actual item.
    final List<Item> items = <Item>[];
    for (String id in itemIds) {
      final DocumentSnapshot<Map<String, dynamic>> itemDoc =
      await _store.collection('items').doc(id).get();
      final Map<String, dynamic> itemJson =
          itemDoc.data() ?? const Item().toJson();
      items.add(Item.fromJson(itemJson));
    }

    // overwrite items property : List<String> -> List<Item>
    itemListJson['items'] = items;
    return ItemList.fromJson(itemListJson);
  }

  void setItemList(ItemList itemList) {
    final Map<String, dynamic> itemListJson = itemList.toJson();
    _store.collection('itemList').doc(itemList.id).set(itemListJson);
  }

  void setItem(Item item) {
    final Map<String, dynamic> itemJson = item.toJson();
    _store.collection('items').doc(item.id).set(itemJson);
  }
}
