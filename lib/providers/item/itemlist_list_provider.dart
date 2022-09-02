// ignore_for_file: type=lint
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controllers/item/itemlist_list_controller.dart';
import '../../models/item_list.dart';

final itemListListProvider = StateNotifierProvider<ItemListListController, ItemList>((ref) => ItemListListController(ref));
