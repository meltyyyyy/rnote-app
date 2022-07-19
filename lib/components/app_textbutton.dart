import 'package:flutter/material.dart';

import 'app_text.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    required this.text,
    required this.textColor,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String text;
  final Function()? onTap;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: Feedback.wrapForTap(onTap, context),
        child: AppText(text, color: textColor, fontWeight: FontWeight.bold));
  }
}
