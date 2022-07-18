// ignore_for_file: type=lint
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controllers/note/selected_item.dart';

final selectedItemProvider =
    StateNotifierProvider<SelectedItemController, List<String>>(
        (ref) => SelectedItemController(<String>[]));
