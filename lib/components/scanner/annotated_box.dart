import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/app_color.dart';

import '../../controllers/scanner/selected_item_controller.dart';
import '../../providers/note/selected_item_provider.dart';

class AnnotatedBox extends HookConsumerWidget {
  const AnnotatedBox(
      {Key? key,
      required this.left,
      required this.top,
      required this.width,
      required this.height,
      required this.text})
      : super(key: key);

  final double left;
  final double top;
  final double width;
  final double height;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<bool> isSelected = useState(false);
    final List<String> selectedItem = ref.watch(selectedItemProvider);
    final SelectedItemController selectedItemCtl =
        ref.watch(selectedItemProvider.notifier);

    return Positioned(
        left: left,
        top: top,
        child: GestureDetector(
          onTap: () {
            selectedItemCtl.add(text);
            isSelected.value = !isSelected.value;
          },
          child: Container(
            color: isSelected.value
                ? AppColor.selectedItem
                : AppColor.annotatedBox,
            width: width,
            height: height,
            child: Center(
              child: Text(text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 4,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ));
  }
}
