import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/user.dart';
import '../../providers/firebase/auth_provider.dart';
import 'auth_controller.dart';

class FirestoreController {
  FirestoreController(this._ref) : super();

  final Ref _ref;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<User> fetchCurrentUser() async {
    final String uid = _ref.read(authProvider).userId;

    if (uid.isEmpty){
      return initialUser;
    }

    final DocumentSnapshot<Map<String, dynamic>> userDoc = await _store.collection('user').doc(uid).get();
    assert (userDoc.data() != null, 'Firestore user/$uid is missing');
    final Map<String, dynamic> userJson = userDoc.data() ?? initialUser.toJson();
    return User.fromJson(userJson);
  }
  
}
