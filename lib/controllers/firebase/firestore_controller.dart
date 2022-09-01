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
    final QuerySnapshot<Map<String, dynamic>> itemListDoc =
        await _store.collection('itemList').get();
    final List<ItemList> itemLists = itemListDoc.docs
        .map((QueryDocumentSnapshot<Map<String, dynamic>> e) =>
            ItemList.fromJson(e.data()))
        .toList();
    return itemLists;
  }

  Future<ItemList> fetchItemListById(String id) async {
    final DocumentSnapshot<Map<String, dynamic>> itemListDoc =
        await _store.collection('itemList').doc(id).get();
    assert(itemListDoc.data() != null, 'Firestore itemList/$id is missing');
    final Map<String, dynamic> itemListJson =
        itemListDoc.data() ?? const ItemList().toJson();
    return ItemList.fromJson(itemListJson);
  }
}
