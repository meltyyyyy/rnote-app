
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';

import '../google_vision/google_vision.dart';

class TextRecognizer {
  TextRecognizer()
      : assert(dotenv.env['GOOGLE_APPLICATION_CREDENTIALS'] != null);

  Future<void> recognize(XFile file) async {
    final GoogleVision googleVision = await GoogleVision.withJwt(
        dotenv.env['GOOGLE_APPLICATION_CREDENTIALS']!);
    final Uint8List encodedBytes = await file.readAsBytes();
    String base64Image = base64Encode(encodedBytes);
    final response = await googleVision.annotate(base64Image);
  }
}
