import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http';


class GoogleVision {
  GoogleVision() : assert(dotenv.env['GOOGLE_APPLICATION_CREDENTIALS'] != null);

  /// authenticate with jwt
  static Future<GoogleVision> withJwt([String scope = 'https://www.googleapis.com/auth/cloud-vision']) async {
    GoogleVision vision = GoogleVision();
    String _json = await rootBundle.loadString(dotenv.env['GOOGLE_APPLICATION_CREDENTIALS']!);
    ServiceAccountCredentials accountCredentials = ServiceAccountCredentials.fromJson(jsonDecode(_json));
    List<String> scopes = <String>[scope];

    var client = http

    return vision;
  }
}