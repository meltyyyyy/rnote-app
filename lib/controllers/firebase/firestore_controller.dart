import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/item.dart';
import '../../models/item_list.dart';
import '../../models/item_lists.dart';
import '../../models/user.dart';
import '../../providers/firebase/auth_provider.dart';
import '../../providers/item/itemlists_provider.dart';

class FirestoreController {
  FirestoreController(this._ref) : super();

  final Ref _ref;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  static const String userPath = 'user';
  static const String itemListPath = 'item_list';
  static const String itemsPath = 'items';

  Future<User> fetchCurrentUser() async {
    final String uid = _ref.read(authProvider.notifier).userId;

    // userId is '' when not logged in
    if (uid.isEmpty) {
      return const User();
    }

    final DocumentSnapshot<Map<String, dynamic>> userDoc =
        await _store.collection(userPath).doc(uid).get();
    assert(userDoc.data() != null, 'Firestore user/$uid is missing');
    final Map<String, dynamic> userJson =
        userDoc.data() ?? const User().toJson();
    return User.fromJson(userJson);
  }

  void setUser(User user) {
    final Map<String, dynamic> userJson = user.toJson();
    _store.collection(userPath).doc(user.id).set(userJson);
  }

  Future<List<ItemList>> fetchItemLists() async {
    final List<ItemList> itemLists = <ItemList>[];

    final QuerySnapshot<Map<String, dynamic>> itemListDoc =
        await _store.collection(itemListPath).get();
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshots =
        itemListDoc.docs;

    for (QueryDocumentSnapshot<Map<String, dynamic>> snapshot in snapshots) {
      final Map<String, dynamic> itemListJson = snapshot.data();

      // Firestore does not accept json array.
      // Save List<String> itemIds instead.
      assert(itemListJson.containsKey('items'),
          'Firestore item_list does not contain key "items"');
      final List<String> itemIds = itemListJson.containsKey('items')
          ? itemListJson['items'].cast<String>() as List<String>
          : <String>[];

      // For each itemIds, fetch actual item.
      final List<Item> items = <Item>[];
      for (String id in itemIds) {
        final DocumentSnapshot<Map<String, dynamic>> itemDoc =
            await _store.collection(itemsPath).doc(id).get();
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
        await _store.collection(itemListPath).doc(id).get();

    // Firestore does not accept json array.
    // Save List<String> itemIds instead.
    assert(itemListDoc.data() != null, 'Firestore item_list/$id is missing');
    final Map<String, dynamic> itemListJson =
        itemListDoc.data() ?? const ItemList().toJson();
    final List<String> itemIds = itemListJson.containsKey('items')
        ? itemListJson['items'] as List<String>
        : <String>[];

    // For each itemIds, fetch actual item.
    final List<Item> items = <Item>[];
    for (String id in itemIds) {
      final DocumentSnapshot<Map<String, dynamic>> itemDoc =
          await _store.collection(itemsPath).doc(id).get();
      final Map<String, dynamic> itemJson =
          itemDoc.data() ?? const Item().toJson();
      items.add(Item.fromJson(itemJson));
    }

    // overwrite items property : List<String> -> List<Item>
    itemListJson['items'] = items;
    return ItemList.fromJson(itemListJson);
  }

  void setItemList(ItemList itemList) {
    if (itemList.createdAt.isEmpty) {
      itemList = itemList.copyWith(createdAt: DateTime.now().toString());
    }

    final Map<String, dynamic> itemListJson = itemList.toJson();

    // Firestore does not accept json array.
    // Save List<String> itemIds instead.
    assert(itemListJson.containsKey('items'),
        'ItemList does not contain key "items"');
    final List<Map<String, dynamic>> itemsJson =
        itemListJson['items'] as List<Map<String, dynamic>>;
    final List<String> itemIds = <String>[];
    for (Map<String, dynamic> itemJson in itemsJson) {
      assert(itemJson.containsKey('id'), '$itemsJson does not contain id');
      final String id =
          itemJson.containsKey('id') ? itemJson['id'] as String : '';
      itemIds.add(id);
    }

    // overwrite items property : List<Item> -> List<String>
    itemListJson['items'] = itemIds;
    _store.collection(itemListPath).doc(itemList.id).set(itemListJson);
  }

  void setItem(Item item) {
    if (item.createdAt.isEmpty) {
      item = item.copyWith(createdAt: DateTime.now().toString());
    }
    item = item.copyWith(updatedAt: DateTime.now().toString());

    // Set Item item to items
    final Map<String, dynamic> itemJson = item.toJson();
    _store.collection(itemsPath).doc(item.id).set(itemJson);

    // Update corresponding item_list/id/items
    // items are List<String> itemIds
    final ItemLists itemLists = _ref.read(itemListsProvider);
    final ItemList itemList = itemLists.itemLists
        .firstWhere((ItemList itemList) => itemList.id == item.itemListId);
    final Map<String, dynamic> itemListJson = itemList.toJson();

    // Firestore does not accept json array.
    // Save List<String> itemIds instead.
    assert(itemListJson.containsKey('items'),
        'ItemList does not contain key "items"');
    final List<Map<String, dynamic>> itemsJson = itemListJson['items']
        .cast<Map<String, dynamic>>() as List<Map<String, dynamic>>;
    final List<String> itemIds = <String>[];
    for (Map<String, dynamic> itemJson in itemsJson) {
      assert(itemJson.containsKey('id'), '$itemsJson does not contain id');
      final String id =
          itemJson.containsKey('id') ? itemJson['id'] as String : '';
      itemIds.add(id);
    }
    // overwrite items property : List<Item> -> List<String>
    itemListJson['items'] = itemIds;

    _store.collection(itemListPath).doc(itemList.id).set(itemListJson);
  }
}
