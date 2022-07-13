import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:googleapis/vision/v1.dart';
import 'package:image_picker/image_picker.dart';

import 'google_vision/google_vision_base.dart';
import 'google_vision/vision_image.dart';

class TextRecognizer {
  TextRecognizer()
      : assert(dotenv.env['GOOGLE_APPLICATION_CREDENTIALS'] != null);

  Future<void> recognize(XFile file) async {
    final GoogleVision googleVision = await GoogleVision.withJwt(
        dotenv.env['GOOGLE_APPLICATION_CREDENTIALS']!);
    final Uint8List encodedBytes = await file.readAsBytes();

    final AnnotateImageRequest request = AnnotateImageRequest(
        image: VisionImage(encodedBytes),
        features: <Feature>[
          Feature(type: 'TEXT_DETECTION'),
        ]);

    final BatchAnnotateImagesResponse response =
        await googleVision.annotate(<AnnotateImageRequest>[request]);

    print(response.responses?.first.textAnnotations?.first.description);
  }
}
