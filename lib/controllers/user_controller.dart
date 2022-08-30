import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user.dart';
import '../providers/firebase/auth_provider.dart';

class UserController extends StateNotifier<User> {
  UserController(this._ref) : super(initialUser);

  final Ref _ref;
}
