import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import 'app_divider.dart';
import 'app_text.dart';
import 'app_textbutton.dart';

class AppBottomSheet {
  static Future<void> show(BuildContext context,
      {required Widget body, double? height}) =>
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
                  child: body)));

  static Widget bottomSheetTitle({
    required String title,
    required Function() proceed,
    required BuildContext context,
    String leadingTitle = '戻る',
    String actionTitle = '変更',
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AppTextButton(
                text: leadingTitle,
                textColor: AppColor.text,
                onTap: () => Navigator.of(context).pop()),
            AppTextButton(
              text: actionTitle,
              textColor: AppColor.normalButton,
              onTap: proceed,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          alignment: Alignment.center,
          child: AppText(
            title,
            fontWeight: FontWeight.bold,
            fontSize: 16,)
        ),
        const SizedBox(height: 16),
        AppDivider.dottedDivider(),
        const SizedBox(height: 16),
      ],
    );
  }
}
