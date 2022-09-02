import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../components/scanner/image_viewer.dart';
import '../../controllers/scanner/image_controller.dart';
import '../../providers/scanner/image_provider.dart';

class Scanner extends HookConsumerWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String base64Image = ref.watch(base64ImageProvider);
    final Base64ImageController base64ImageCtl =
        ref.watch(base64ImageProvider.notifier);

    Future<void> _annotate() async {
      final ImagePicker imagePicker = ImagePicker();
      final XFile? file =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        final Uint8List _encodedBytes = await file.readAsBytes();
        await base64ImageCtl.recognize(base64Encode(_encodedBytes));
        base64ImageCtl.annotate();
      }
    }

    return Scaffold(
        body: Center(
          child: base64Image.isEmpty
              ? const Text('No Image Selected')
              : const ImageViewer(),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.camera_alt), onPressed: () => _annotate()));
  }
}
