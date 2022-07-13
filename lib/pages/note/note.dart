import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:googleapis/vision/v1.dart' as vision;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart' as picker;

import '../../providers/note/image_file.dart';
import '../../utils/text_recognizer.dart';

class Note extends HookConsumerWidget {
  const Note({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String filePath = ref.watch(filePathProvider);
    final String base64Image = ref.watch(base64ImageProvider);
    final StateController<String> filePathCtl =
        ref.watch(filePathProvider.notifier);
    final StateController<String> base64ImageCtl =
        ref.watch(base64ImageProvider.notifier);

    return Scaffold(
      body: Center(
        child: filePath.isEmpty && base64Image.isEmpty
            ? const Text('No Image Selected')
            : base64Image.isNotEmpty
                ? Image.memory(base64Decode(base64Image))
                : Image.file(File(filePath)),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.camera_alt),
          onPressed: () async {
            final picker.ImagePicker imagePicker = picker.ImagePicker();
            final picker.XFile? file =
                await imagePicker.pickImage(source: picker.ImageSource.gallery);
            if (file != null) {
              filePathCtl.update((_) => file.path);
              final TextRecognizer recognizer = TextRecognizer();
              List<vision.EntityAnnotation>? textAnnotations =
                  await recognizer.recognize(file);
              if (textAnnotations != null) {
                String _base64Image =
                    recognizer.drawAnnotations(textAnnotations);
                base64ImageCtl.update((String state) => _base64Image);
              }
            }
          }),
    );
  }
}
