import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
}
