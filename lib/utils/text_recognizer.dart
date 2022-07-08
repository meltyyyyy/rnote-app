import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_vision/google_vision.dart';
import 'package:google_vision/src/model/localized_object_annotation.dart';

class TextRecognizer {
  Image? croppedImage;
  Image? labeledImage;

  final String _jwt = dotenv.env['GOOGLE_APPLICATION_CREDENTIALS']!;

  Future<Image?> annotate(String filePath) async {
    final GoogleVision _googleVision = await GoogleVision.withJwt(_jwt);
    final Image image = Image.fromFilePath(filePath);

    // Cropping an image to save the image to upload
    croppedImage = image.copyCrop(70, 30, 640, 480);
    final AnnotationRequests requests =
        AnnotationRequests(requests: <AnnotationRequest>[
      AnnotationRequest(
          image: croppedImage!,
          features: <Feature>[Feature(maxResults: -1, type: 'TEXT_DETECTION')])
    ]);

    // TODO(meltyyyyy): add error handle
    final AnnotatedResponses responses =
        await _googleVision.annotate(requests: requests);

    for (AnnotateImageResponse response in responses.responses) {
      for (LocalizedObjectAnnotation annotation
          in response.localizedObjectAnnotations) {
        print(annotation.name);
      }
      for (LabelAnnotation annotation in response.labelAnnotations) {
        print(annotation.description);
      }
    }
  }
}
