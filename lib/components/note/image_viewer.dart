import 'package:flutter/material.dart';
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

    return InteractiveViewer(
        child: Container(
          color: Colors.red,
          child: Stack(
           children: <Widget>[
             Image.memory(base64ImageCtl.toByte),
           ],
          ),
        )
    );
  }
}
