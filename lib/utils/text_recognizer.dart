import 'dart:typed_data';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:googleapis/vision/v1.dart';

import 'google_apis/google_vision_base.dart';
import 'google_apis/vision_image.dart';




class TextRecognizer {
  TextRecognizer()
      : assert(dotenv.env['GOOGLE_APPLICATION_CREDENTIALS'] != null);

  static VisionImage? image;

  Future<List<EntityAnnotation>?> recognize(Uint8List encodedBytes) async {
    final GoogleVision googleVision = await GoogleVision.withJwt(
        dotenv.env['GOOGLE_APPLICATION_CREDENTIALS']!);
    image = VisionImage(encodedBytes);
    final AnnotateImageRequest _request =
        AnnotateImageRequest(image: image, features: <Feature>[
      Feature(type: 'TEXT_DETECTION'),
    ]);

    final BatchAnnotateImagesResponse _response =
        await googleVision.annotate(<AnnotateImageRequest>[_request]);

    // print(_response.responses?.first.textAnnotations?.first.description);
    return _response.responses?.first.textAnnotations;
  }

  String drawAnnotations(List<EntityAnnotation> textAnnotations) {
    assert(image != null);

    for (final EntityAnnotation textAnnotation in textAnnotations) {
      if (textAnnotation.boundingPoly?.vertices != null) {
        GoogleVision.drawAnnotations(
            image!, textAnnotation.boundingPoly!.vertices!);
      }
    }

    return image!.toBase64Image;
  }
}
