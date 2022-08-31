import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controllers/firebase/firestore_controller.dart';

// ignore_for_file: type=lint
final storeProvider =
    Provider<FirestoreController>((ref) => FirestoreController(ref));
