import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:googleapis/vision/v1.dart';



class GoogleVision {
  GoogleVision() : assert(dotenv.env['GOOGLE_APPLICATION_CREDENTIALS'] != null);

  /// authenticate with JWT
  static Future<GoogleVision> withJwt([String scope = 'https://www.googleapis.com/auth/cloud-vision']) async {
    GoogleVision vision = GoogleVision();
    String _json = await rootBundle.loadString(dotenv.env['GOOGLE_APPLICATION_CREDENTIALS']!);

    return vision;
  }
}