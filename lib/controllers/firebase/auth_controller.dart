import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/firebase/auth_provider.dart';

class AuthController extends StateNotifier<User?> {
  AuthController(this._ref, { User? initialUser }) : super(initialUser) {
    _auth.authStateChanges().listen((User? user) {
      state = user;
    });
  }

  final Ref _ref;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get userId => _auth.currentUser?.uid ?? '';
  String get email => _auth.currentUser?.email ?? '';
  bool get isSignIn => _auth.currentUser != null;

  Future<bool> signIn(String email, String password) async {
    final StateController<String> errorCtl = _ref.read(authErrorProvider.notifier);
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user != null;
    } on FirebaseAuthException catch(e) {
      errorCtl.update((_) => getErrorMessage(e));
      debugPrintStack(stackTrace: e.stackTrace);
      return false;
    }
  }

  Future<bool> signUp(String email, String password) async {
    final StateController<String> errorCtl = _ref.read(authErrorProvider.notifier);
    try {
      final UserCredential credential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user != null;
    } on FirebaseAuthException catch(e){
      errorCtl.update((_) => getErrorMessage(e));
      debugPrintStack(stackTrace: e.stackTrace);
      return false;
    }
  }

  void signOut() {
    _auth.signOut();
  }

  String getErrorMessage(FirebaseAuthException e){
    switch (e.code) {
      case 'wrong-password':
        return 'パスワードが間違っています';
      case 'user-not-found':
        return 'メールアドレスかパスワードが正しくありません';
      case 'user-disabled':
        return '無効なユーザーです';
      case 'invalid-email':
        return '正しいメールアドレスの形式で入力してください';
      case 'email-already-in-use':
        return 'このメールアドレスはすでに使用されています';
      case 'operation-not-allowed':
        return 'このアカウントは無効化されています';
      case 'weak-password':
        return 'パスワードの強度が低いです';
      default:
        return 'ログインに失敗しました';
    }
  }
}
