
import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class AppText extends Text {
  AppText(String value,
      {Key? key, double fontSize = 14,
        FontWeight fontWeight = FontWeight.w300,
        Color? color,
        int? maxLines,
        TextOverflow? overflow})
      : super(key: key,
    value,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? AppColor.text,
    ),
    maxLines: maxLines,
    overflow: overflow,
  );
}
