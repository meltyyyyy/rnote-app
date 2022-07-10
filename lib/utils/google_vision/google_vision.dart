import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

class GoogleVision {
  GoogleVision() : assert(dotenv.env['GOOGLE_APPLICATION_CREDENTIALS'] != null);

  static AccessToken? _accessToken;

  String? get _token => _accessToken?.data;
  String? get _tokenType => _accessToken?.type;
  DateTime? get tokenExpiry => _accessToken?.expiry;

  /// authenticate with jwt
  static Future<GoogleVision> withJwt(
      [String scope = 'https://www.googleapis.com/auth/cloud-vision']) async {
    String _json = await rootBundle
        .loadString(dotenv.env['GOOGLE_APPLICATION_CREDENTIALS']!);
    ServiceAccountCredentials accountCredentials =
        ServiceAccountCredentials.fromJson(jsonDecode(_json));
    List<String> scopes = <String>[scope];

    http.Client client = http.Client();
    AccessCredentials credentials =
        await obtainAccessCredentialsViaServiceAccount(
            accountCredentials, scopes, client);
    _accessToken = credentials.accessToken;
    client.close();
    return GoogleVision();
  }
}
