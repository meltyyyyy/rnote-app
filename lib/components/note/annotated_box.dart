import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class AnnotatedBox extends StatelessWidget {
  const AnnotatedBox({Key? key,
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
  Widget build(BuildContext context) {
    return Positioned(
        left: left,
        top: top,
        child: Container(
          color: AppColor.annotatedBox,
          width: width,
          height: height,
          child: Center(child:
          Text(text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 4,
                  fontWeight: FontWeight.bold
              )
          ),),
        )
    );
  }
}
