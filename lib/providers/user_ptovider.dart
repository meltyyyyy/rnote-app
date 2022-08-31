import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/user_controller.dart';
import '../models/user.dart';

// ignore_for_file: type=lint
final userProvider = StateNotifierProvider<UserController, User>((ref) => UserController(ref));