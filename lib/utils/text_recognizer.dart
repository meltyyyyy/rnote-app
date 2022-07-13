import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:googleapis/vision/v1.dart';
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

    final AnnotateImageRequest request = AnnotateImageRequest(
        image: Image(content: base64Image),
        features: <Feature>[
          Feature(type: 'TEXT_DETECTION'),
        ]);

    final BatchAnnotateImagesResponse response =
        await googleVision.annotate(<AnnotateImageRequest>[request]);
  }
}
