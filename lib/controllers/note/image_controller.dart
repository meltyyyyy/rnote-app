import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:googleapis/vision/v1.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/text_recognizer.dart';

class Base64ImageController extends StateNotifier<String> {
  Base64ImageController(super.state) : _original = state;

  final TextRecognizer _recognizer = TextRecognizer();

  List<EntityAnnotation>? _annotations;
  final String _original;

  List<EntityAnnotation> get annotations =>
      _annotations ?? <EntityAnnotation>[];
  String get original => _original;
  Uint8List get toByte => base64Decode(state);

  Future<void> recognize(String base64Image) async {
    state = base64Image;
    final Uint8List encodedBytes = base64Decode(base64Image);
    _annotations = await _recognizer.recognize(encodedBytes);
  }

  void annotate() {
    state = _recognizer.drawAnnotations(annotations);
  }

  Size calcSize(EntityAnnotation annotation) {
    assert(annotation.boundingPoly?.vertices != null);
    assert(annotation.boundingPoly?.vertices?.length == 4);
    final Vertex _upperLeft = annotation.boundingPoly!.vertices![0];
    final Vertex _lowerRight = annotation.boundingPoly!.vertices![2];

    if (_upperLeft.x == null &&
        _upperLeft.y == null &&
        _lowerRight.x == null &&
        _lowerRight.y == null) {
      return Size.zero;
    }

    final double width = _lowerRight.x!.toDouble() - _upperLeft.x!.toDouble();
    final double height = _lowerRight.y!.toDouble() - _upperLeft.y!.toDouble();

    return Size(width, height);
  }

  Offset calcOffset(EntityAnnotation annotation) {
    assert(annotation.boundingPoly?.vertices != null);
    assert(annotation.boundingPoly?.vertices?.length == 4);
    final Vertex _upperLeft = annotation.boundingPoly!.vertices![0];

    if (_upperLeft.x == null && _upperLeft.y == null) {
      return Offset.zero;
    }

    return Offset(_upperLeft.x!.toDouble(), _upperLeft.y!.toDouble());
  }
}
