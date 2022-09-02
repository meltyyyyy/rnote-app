import '../models/item.dart';
import '../models/item_list.dart';

ItemList shoppingList = ItemList(
    id: '04d7df10-2aca-11ed-b7ca-793c5f027ab8',
    title: '買い出しリスト',
    items: <Item>[],
    createdAt: DateTime(2022).toString());

ItemList starredItems = ItemList(
    id: '050b2410-2aca-11ed-beaf-377d39f6d334',
    title: 'Starred',
    items: <Item>[],
    createdAt: DateTime.now().toString());
