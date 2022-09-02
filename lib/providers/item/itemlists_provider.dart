// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controllers/item/itemlists_controller.dart';
import '../../models/item_lists.dart';

final itemListsProvider = StateNotifierProvider<ItemListsController, ItemLists>(
    (ref) => ItemListsController(ref));
