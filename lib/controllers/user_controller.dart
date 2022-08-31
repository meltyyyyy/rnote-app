import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user.dart';
import '../providers/firebase/auth_provider.dart';
import '../providers/firebase/firestore_provider.dart';
import 'firebase/auth_controller.dart';
import 'firebase/firestore_controller.dart';

class UserController extends StateNotifier<User> {
  UserController(this._ref) : super(const User()) { _init(); }

  final Ref _ref;
  
  Future<void> _init() async {
    final FirestoreController storeCtl = _ref.read(storeProvider);
    final User user = await storeCtl.fetchCurrentUser();
    state = user;
  }

  Future<bool> signUp(String email, String password) async {
    final AuthController authCtl = _ref.read(authProvider.notifier);
    final FirestoreController storeCtl = _ref.read(storeProvider);

    final bool result = await authCtl.signUp(email, password);
    if(result){
      state = User(id: authCtl.userId, email: authCtl.email);
      storeCtl.setUser(state);
      return result;
    }

    return result;
  }

  Future<bool> signIn(String email, String password) async {
    final AuthController authCtl = _ref.read(authProvider.notifier);
    final FirestoreController storeCtl = _ref.read(storeProvider);

    final bool result = await authCtl.signIn(email, password);
    if(result){
      state = await storeCtl.fetchCurrentUser();
      return result;
    }

    return result;
  }
}
