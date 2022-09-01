import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:uuid/uuid.dart';
import '../../models/item_list.dart';

class ItemListController extends StateNotifier<List<ItemList>> {
  ItemListController(this._ref) : super(<ItemList>[]);

  final Ref _ref;

  void createNewList(String title){

  }
}
