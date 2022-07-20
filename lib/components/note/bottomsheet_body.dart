import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/note/selected_item.dart';
import '../../utils/task_controller.dart';
import '../app_bottomsheet.dart';
import '../app_input.dart';

class BottomSheetBody extends HookConsumerWidget {
  const BottomSheetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> selectedItem = ref.watch(selectedItemProvider);
    final TextEditingController textCtl = useTextEditingController(text: selectedItem.join(''));

    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppBottomSheet.bottomSheetTitle(
            title: '買いものリストに追加',
            actionTitle: '追加',
            proceed: () {
              final TaskController taskCtl = TaskController();
              taskCtl.postTask(textCtl.text);
            },
            context: context),
        const SizedBox(height: 8),
        AppInput.medium(textCtl,
            autofocus: false,
            textInputType: TextInputType.text,
            hintText: 'レシピ'),
      ],
    );
  }
}
