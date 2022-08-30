import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthController {
  AuthController(this._ref) : super();

  final Ref _ref;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get userId => _auth.currentUser?.uid ?? '';

  Future<bool> signIn(String email, String password) async {
    final UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return credential.user != null;
  }

  Future<bool> signUp(String email, String password) async {
    final UserCredential credential = await _auth
        .createUserWithEmailAndPassword(email: email, password: password);
    return credential.user != null;
  }

  void signOut() {
    _auth.signOut();
  }

  bool isSignIn(){
    return _auth.currentUser != null;
  }
}
