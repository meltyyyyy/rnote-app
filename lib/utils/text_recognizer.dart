

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../google_vision/google_vision.dart';
import '../google_vision/models/annotated_responses.dart';
import '../google_vision/models/annotation_request.dart';
import '../google_vision/models/annotation_requests.dart';
import '../google_vision/models/feature.dart';
import '../google_vision/models/image.dart';



class TextRecognizer {
  TextRecognizer() : assert(dotenv.env['GOOGLE_APPLICATION_CREDENTIALS'] != null);

  Future<void> recognize(String filePath) async {
    final GoogleVision googleVision = await GoogleVision.withJwt(dotenv.env['GOOGLE_APPLICATION_CREDENTIALS']!);
    final Image image = Image.fromFilePath(filePath);

    final Image cropped = image.copyCrop(70, 30, 640, 480);
    await cropped.writeAsJpeg('cropped.jpg');
    final AnnotationRequests requests = AnnotationRequests(requests: [
      AnnotationRequest(image: cropped, features: [
        Feature(maxResults: 100, type: 'TEXT_DETECTION'),
      ])
    ]);

    final AnnotatedResponses annotatedResponses = await googleVision.annotate(requests: requests);
  }
}
