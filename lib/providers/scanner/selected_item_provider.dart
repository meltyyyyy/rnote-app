// ignore_for_file: type=lint
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controllers/scanner/selected_item_controller.dart';

final selectedItemProvider =
    StateNotifierProvider<SelectedItemController, List<String>>(
        (ref) => SelectedItemController(<String>[]));
