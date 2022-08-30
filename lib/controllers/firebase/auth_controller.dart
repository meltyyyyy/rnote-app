import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/user.dart';

class AuthController extends StateNotifier<User?> {
  AuthController(super.state);
}
