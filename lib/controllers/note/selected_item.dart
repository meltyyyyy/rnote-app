import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectedItemController extends StateNotifier<List<String>> {
  SelectedItemController(super.state);

  void add(String item) {
    state = <String>[item, ...state];
  }
}
