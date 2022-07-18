import 'package:flutter/material.dart';
import 'package:googleapis/vision/v1.dart' as vision;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controllers/note/image.dart';
import '../../providers/note/image.dart';

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

    return InteractiveViewer(child: Builder(builder: (BuildContext context) {
      final List<Widget> _annotatedTexts = <Widget>[];
      for (final vision.EntityAnnotation annotation
          in base64ImageCtl.annotations) {
        if (annotation.boundingPoly?.vertices != null &&
            annotation.boundingPoly!.vertices!.length == 4) {
          final vision.Vertex _upperLeft =
              annotation.boundingPoly!.vertices![0];
          final vision.Vertex _lowerRight =
              annotation.boundingPoly!.vertices![2];

          if (_upperLeft.x == null &&
              _upperLeft.y == null &&
              _lowerRight.x == null &&
              _lowerRight.y == null) {
            continue;
          }

          final double dx =
              _lowerRight.x!.toDouble() - _upperLeft.x!.toDouble();
          final double dy =
              _lowerRight.y!.toDouble() - _upperLeft.y!.toDouble();

          if (0 < dx && dx < _width * _dpr / 3 && 0 < dy && dy < _height * _dpr / 3) {
            _annotatedTexts.add(
                Positioned(
                  left: _upperLeft.x!.toDouble() / _dpr,
                  top: _upperLeft.y!.toDouble() / _dpr,
                  child: GestureDetector(
                    onTap: () {
                      print('ontap');
                      print(annotation.description);
                    },
                    child: ColoredBox(
                      color: Colors.orange,
                      child: SizedBox(
                        width: dx / _dpr,
                        height: dy / _dpr,
                      ),
                    ),
                  ),
                )
            );
          }
        }
      }
      return Stack(
        children: <Widget>[
          Image.memory(base64ImageCtl.toByte),
          ..._annotatedTexts
        ],
      );
    }));
  }
}
