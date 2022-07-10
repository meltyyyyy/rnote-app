import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:googleapis/vision/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

class GoogleVision {
  GoogleVision() : assert(dotenv.env['GOOGLE_APPLICATION_CREDENTIALS'] != null);

  static AccessToken? _accessToken;
  static AutoRefreshingAuthClient? _rest;

  String? get _token => _accessToken?.data;
  String? get _tokenType => _accessToken?.type;
  DateTime? get tokenExpiry => _accessToken?.expiry;

  /// authenticate with jwt
  static Future<GoogleVision> withJwt() async {
    final GoogleVision googleVision = GoogleVision();
    String _json = await rootBundle
        .loadString(dotenv.env['GOOGLE_APPLICATION_CREDENTIALS']!);
    ServiceAccountCredentials accountCredentials = ServiceAccountCredentials.fromJson(jsonDecode(_json));
    List<String> scopes = <String>[VisionApi.cloudVisionScope];
    AutoRefreshingAuthClient _client = await clientViaServiceAccount(
        accountCredentials, scopes);

    _accessToken = _client.credentials.accessToken;
    _rest = _client;
    return googleVision;
  }
}
