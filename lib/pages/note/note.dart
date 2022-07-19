import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../components/note/image_viewer.dart';
import '../../controllers/note/image.dart';
import '../../providers/bottom_sheet_state.dart';
import '../../providers/note/image.dart';

class Note extends HookConsumerWidget {
  const Note({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String base64Image = ref.watch(base64ImageProvider);
    final Base64ImageController base64ImageCtl =
        ref.watch(base64ImageProvider.notifier);

    ref.listen(bottomSheetStateProvider, (bool? previous, bool next) {
      if (next) {
        showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return const SizedBox(height: 120);
            });
      }
    });

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
