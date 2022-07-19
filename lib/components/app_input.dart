import 'package:flutter/material.dart';

import '../constants/app_color.dart';


class AppInput {
  static const double smallHeight = 32;
  static const double smallWidth = 40;
  static const double mediumHeight = 42;
  static const double largeHeight = 160;

  static Widget base(
      TextEditingController controller, {
        double? height,
        double? width,
        int? maxLines,
        int? maxLength,
        TextInputType textInputType = TextInputType.text,
        String hintText = '',
        bool? enabled,
        bool autofocus = false,
        bool obscureText = false,
        TextAlign textAlign = TextAlign.start,
        TextStyle? style,
        TextStyle? hintStyle,
        Color borderColor = AppColor.inputBorder,
        EdgeInsets contentPadding = const EdgeInsets.all(8),
        Alignment alignment = Alignment.center,
        Function(String)? onChanged,
        Function()? onEditingComplete,
      }) {
    final FocusNode _focusNode = FocusNode();
    return GestureDetector(
      onTap: () => _focusNode.requestFocus(),
      child: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.all(1),
        alignment: alignment,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: borderColor),
            borderRadius: const BorderRadius.all(Radius.circular(3))),
        child: TextField(
          focusNode: _focusNode,
          cursorColor: AppColor.cursor,
          autofocus: autofocus,
          obscureText: obscureText,
          cursorWidth: 1,
          keyboardType: textInputType,
          controller: controller,
          style: style,
          textAlign: textAlign,
          enabled: enabled,
          minLines: 1,
          maxLines: maxLines,
          maxLength: maxLength,
          decoration: InputDecoration(
              isDense: true,
              counterText: '',
              contentPadding: contentPadding,
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: hintStyle),
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
        ),
      ),
    );
  }

  static Widget small(
      TextEditingController controller, {
        String hintText = '',
        TextInputType textInputType = TextInputType.text,
        bool obscureText = false,
        bool autofocus = false,
        double? height,
      }) {
    return AppInput.base(
      controller,
      height: height ?? AppInput.smallHeight,
      obscureText: obscureText,
      autofocus: autofocus,
      textInputType: textInputType,
      hintText: hintText,
      hintStyle: const TextStyle(fontSize: 12),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      style: const TextStyle(fontSize: 16),
    );
  }

  static Widget medium(TextEditingController controller,
      {int? maxLines,
        double? height,
        double? width,
        String hintText = '',
        TextInputType textInputType = TextInputType.text,
        TextAlign textAlign = TextAlign.start,
        bool isDisabled = false,
        bool obscureText = false,
        bool autofocus = false,
        int? maxLength,
        Function(String)? onChanged,
        Function()? onEditingComplete}) {
    return AppInput.base(controller,
        height: height ?? AppInput.mediumHeight,
        width: width,
        maxLines: maxLines,
        maxLength: maxLength,
        textInputType: textInputType,
        hintStyle: const TextStyle(color: AppColor.inputBorder),
        textAlign: textAlign,
        hintText: hintText,
        enabled: !isDisabled,
        style: TextStyle(
            color: isDisabled ? AppColor.disable : AppColor.text, fontSize: 14),
        borderColor: isDisabled ? AppColor.disable : AppColor.inputBorder,
        obscureText: obscureText,
        autofocus: autofocus,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete);
  }

  static Widget large(
      TextEditingController controller, {
        double? height,
        double? width,
        int? maxLines = 6,
        String hintText = '',
        TextInputType textInputType = TextInputType.multiline,
        Function(String)? onChanged,
        bool autofocus = false,
      }) {
    return AppInput.base(controller,
        height: height ?? AppInput.largeHeight,
        width: width,
        alignment: Alignment.topLeft,
        autofocus: autofocus,
        hintText: hintText,
        textInputType: textInputType,
        style: const TextStyle(fontSize: 14),
        maxLines: maxLines,
        onChanged: onChanged);
  }
}
