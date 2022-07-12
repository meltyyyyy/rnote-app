import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';

import '../google_vision/google_vision.dart';
import '../google_vision/models/annotated_responses.dart';
import '../google_vision/models/annotation_request.dart';
import '../google_vision/models/annotation_requests.dart';
import '../google_vision/models/feature.dart';
import '../google_vision/models/image.dart';

class TextRecognizer {
  TextRecognizer()
      : assert(dotenv.env['GOOGLE_APPLICATION_CREDENTIALS'] != null);

  Future<void> recognize(XFile file) async {
    final GoogleVision googleVision = await GoogleVision.withJwt(
        dotenv.env['GOOGLE_APPLICATION_CREDENTIALS']!);
    final Uint8List encodedBytes = await file.readAsBytes();
    final Image image = Image(encodedBytes);
    final Image cropped = image.copyCrop(70, 30, 640, 480);
    final AnnotationRequests requests = AnnotationRequests(requests: <AnnotationRequest>[
      AnnotationRequest(image: cropped, features: <Feature>[
        Feature(maxResults: 100, type: 'TEXT_DETECTION'),
      ])
    ]);

    final AnnotatedResponses annotatedResponses =
        await googleVision.annotate(requests: requests);

    print(annotatedResponses);
  }
}
