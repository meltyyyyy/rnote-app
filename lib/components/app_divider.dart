import 'package:flutter/material.dart';

import '../constants/app_color.dart';


class AppDivider {
  static Widget dottedDivider() {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double boxWidth = constraints.constrainWidth();
          const double dashWidth = 3;
          const double dashHeight = 1;
          final int dashCount = (boxWidth / (2.0 * dashWidth)).floor();
          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: List<Widget>.generate(dashCount, (_) {
              return const SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: AppColor.divider),
                ),
              );
            }),
          );
        });
  }
}
