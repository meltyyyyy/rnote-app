import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/app_color.dart';
import 'app_calendar.dart';
import 'app_divider.dart';
import 'app_text.dart';
import 'app_textbutton.dart';

class AppBottomSheet extends HookConsumerWidget {
  const AppBottomSheet({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context, {double? height}) =>
      showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          context: context,
          builder: (BuildContext context) {
            return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                    height: height ?? MediaQuery.of(context).size.height * 2 / 5,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                    child: BottomSheetContent()
                )
            );
          }
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      elevation: 24,
      child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Icon(Icons.menu, color: AppColor.text),
                  SizedBox.shrink()
                ],
              ),
            ],
          )),
    );
  }
}

class BottomSheetContent extends HookConsumerWidget {
  const BottomSheetContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController _itemCtl = useTextEditingController(text: '');
    final TextEditingController _numCtl = useTextEditingController(text: '');
    final TextEditingController _memoCtl = useTextEditingController(text: '');

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AppTextButton(
                text: '戻る',
                textColor: AppColor.text,
                onTap: () => Navigator.of(context).pop()),
            AppTextButton(
              text: '保存',
              textColor: AppColor.normalButton,
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
            alignment: Alignment.center,
            child: AppText(
              '買いたいもの',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )),
        const SizedBox(height: 16),
        AppDivider.dottedDivider(),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _itemCtl,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: '買うもの',
                ),
              ),
            ),
            const SizedBox(width: 24),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 40,
                  child: TextField(
                    controller: _numCtl,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Text('個')
              ],
            )
          ],
        ),
        TextField(
          controller: _memoCtl,
          style: const TextStyle(fontSize: 12),
          decoration: const InputDecoration(
            hintText: 'メモ',
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: const Icon(Icons.menu, size: 28,),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () => AppCalendar.show(context),
              child: const Icon(Icons.edit_calendar_rounded, size: 28),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () {},
              child: const Icon(Icons.star, size: 28),
            ),
          ],
        )
      ],
    );
  }
}
