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
    final Base64ImageController base64ImageCtl = ref.watch(base64ImageProvider.notifier);
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.width;

    return InteractiveViewer(
        child: Builder(
            builder: (BuildContext context) {
              final List<Widget> _annotatedTexts = <Widget>[];
              for(final vision.EntityAnnotation annotation in base64ImageCtl.annotations){
                if (annotation.boundingPoly?.vertices != null) {
                  final List<vision.Vertex> vertices = annotation.boundingPoly!.vertices!;
                  for (int index = 0; index < vertices.length - 1; index++) {
                    final vision.Vertex vStart = vertices[index];

                    final vision.Vertex vStop = vertices[index + 1];

                    if (vStart.x != null &&
                        vStart.y != null &&
                        vStop.x != null &&
                        vStop.y != null) {
                      // print(vStart.x!.toDouble() / _width);
                      _annotatedTexts.add(
                          Positioned(
                            left: vStart.x!.toDouble(),
                              top: vStart.y!.toDouble(),
                              child: ColoredBox(
                                color: Colors.orange,
                                child: SizedBox(
                                  width: (vStop.x!.toDouble() - vStart.x!.toDouble()).abs(),
                                  height: (vStop.y!.toDouble() - vStart.y!.toDouble()).abs(),
                                ),
                              )
                          )
                      );
                    }
                  }
                }
              }
              return Stack(
                children: <Widget>[
                  Image.memory(base64ImageCtl.toByte),
                  ..._annotatedTexts
                ],
              );
            })
    );
  }
}
