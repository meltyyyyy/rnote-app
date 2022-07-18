// ignore_for_file: type=lint
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controllers/note/image.dart';

final base64ImageProvider =
    StateNotifierProvider<Base64ImageController, String>(
        (ref) => Base64ImageController(""));
