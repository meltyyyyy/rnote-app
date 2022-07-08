import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class Note extends HookConsumerWidget {
  const Note({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<XFile?> imageNotifier = useState<XFile?>(null);
    final XFile? image = imageNotifier.value;

    useEffect(() {
      return imageNotifier.dispose;
    }, <Object?>[]);

    return Scaffold(
      body: Center(
        child: image != null
            ? Image.file(File(image.path))
            : const Text('No Image Selected'),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.camera_alt),
          onPressed: () async {
            final ImagePicker picker = ImagePicker();
            final XFile? image =
                await picker.pickImage(source: ImageSource.gallery);
            imageNotifier.value = image;
          }),
    );
  }
}
