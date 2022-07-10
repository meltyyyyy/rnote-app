import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../providers/note/image_file.dart';
import '../../utils/google_vision/google_vision.dart';
import '../../utils/text_recognizer.dart';

class Note extends HookConsumerWidget {
  const Note({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String filePath = ref.watch(filePathProvider);
    final StateController<String> filePathCtl =
        ref.watch(filePathProvider.notifier);

    return Scaffold(
      body: Center(
        child: filePath.isNotEmpty
            ? Image.file(File(filePath))
            : const Text('No Image Selected'),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.camera_alt),
          onPressed: () async {
            final ImagePicker picker = ImagePicker();
            final XFile? file =
                await picker.pickImage(source: ImageSource.gallery);
            if (file != null) {
              filePathCtl.update((_) => file.path);
              final gv = await GoogleVision.withJwt();
              Image image = Image.file(File(filePath));
              Uint8List imageBytes = await File(file.path).readAsBytes();
              String base64Image = base64Encode(imageBytes);
              gv.annotate(base64Image);
            }
          }),
    );
  }
}
