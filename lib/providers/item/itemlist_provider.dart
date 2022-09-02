// ignore_for_file: type=lint
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controllers/item/itemlist_controller.dart';
import '../../models/item_list.dart';

final itemListProvider = StateNotifierProvider<ItemListController, ItemList>(
    (ref) => ItemListController(ref));
