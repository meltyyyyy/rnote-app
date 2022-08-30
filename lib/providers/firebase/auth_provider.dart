import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controllers/firebase/auth_controller.dart';

// ignore_for_file: type=lint
final authProvider = Provider<AuthController>((ref) => AuthController(ref));
