import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:googleapis/vision/v1.dart' as vision;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controllers/scanner/image_controller.dart';
import '../../providers/scanner/image_provider.dart';
import 'annotated_box.dart';

class ImageViewer extends ConsumerWidget {
  const ImageViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String base64Image = ref.watch(base64ImageProvider);
    final Base64ImageController base64ImageCtl =
        ref.watch(base64ImageProvider.notifier);
    final double _width = MediaQuery.of(context).size.height;
    final double _height = MediaQuery.of(context).size.width;
    final double _dpr = MediaQuery.of(context).devicePixelRatio;

    return InteractiveViewer(
        child: Stack(
      children: <Widget>[
        Image.memory(base64Decode(base64Image)),
        ...base64ImageCtl.annotations.map((vision.EntityAnnotation annotation) {
          if (annotation.boundingPoly?.vertices == null ||
              annotation.boundingPoly!.vertices!.length != 4) {
            return const SizedBox.shrink();
          }

          final Size size = base64ImageCtl.calcSize(annotation);
          final Offset offset = base64ImageCtl.calcOffset(annotation);

          if (0 < size.width &&
              size.width < _width * _dpr / 3 &&
              0 < size.height &&
              size.height < _height * _dpr / 3) {
            return AnnotatedBox(
                text: annotation.description ?? '',
                width: size.width / _dpr,
                height: size.height / _dpr,
                left: offset.dx / (_dpr + 1),
                top: offset.dy / (_dpr + 1));
          }

          return const SizedBox.shrink();
        }).toList(),
      ],
    ));
  }
}
