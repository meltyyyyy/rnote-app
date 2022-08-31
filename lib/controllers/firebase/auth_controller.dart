import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthController extends StateNotifier<User?> {
  AuthController({ User? initialUser }) : super(initialUser) {
    _auth.authStateChanges().listen((User? user) {
      state = user;
    });
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get userId => _auth.currentUser?.uid ?? '';
  String get email => _auth.currentUser?.email ?? '';
  bool get isSignIn => _auth.currentUser != null;

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
}
