import 'dart:convert';
import 'dart:typed_data';

import 'package:googleapis/vision/v1.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/text_recognizer.dart';

class Base64ImageController extends StateNotifier<String>{
  Base64ImageController(super.state);

  final TextRecognizer _recognizer = TextRecognizer();

  List<EntityAnnotation>? _annotations;

  List<EntityAnnotation> get annotations => _annotations ?? <EntityAnnotation>[];
  Uint8List get toByte => base64Decode(state);

  Future<void> recognize(String base64Image) async {
    state = base64Image;
    final Uint8List encodedBytes = base64Decode(base64Image);
    _annotations = await _recognizer.recognize(encodedBytes);
  }

  void annotate(){
    state = _recognizer.drawAnnotations(annotations);
  }
}
