import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controllers/firebase/auth_controller.dart';

// ignore_for_file: type=lint
final authProvider = StateNotifierProvider<AuthController, User?>((ref) => AuthController(initialUser: FirebaseAuth.instance.currentUser));
