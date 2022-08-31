import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/app_color.dart';
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
          builder: (BuildContext context) => Padding(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          AppTextButton(
                              text: 'back',
                              textColor: AppColor.text,
                              onTap: () => Navigator.of(context).pop()),
                          AppTextButton(
                            text: 'save',
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
                    ],
                  ))));

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
