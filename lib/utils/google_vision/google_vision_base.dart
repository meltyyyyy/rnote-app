import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:googleapis/vision/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:rnote_app/utils/google_vision/vision_image.dart';

class GoogleVision {
  GoogleVision();

  static AccessToken? _accessToken;
  static AutoRefreshingAuthClient? _client;

  String? get _token => _accessToken?.data;
  String? get _tokenType => _accessToken?.type;
  DateTime? get tokenExpiry => _accessToken?.expiry;

  /// authenticate with jwt
  static Future<GoogleVision> withJwt(String jwtPath) async {
    final GoogleVision googleVision = GoogleVision();

    String _json = await rootBundle.loadString(jwtPath);
    ServiceAccountCredentials accountCredentials =
        ServiceAccountCredentials.fromJson(jsonDecode(_json));
    List<String> scopes = <String>[VisionApi.cloudVisionScope];
    AutoRefreshingAuthClient client =
        await clientViaServiceAccount(accountCredentials, scopes);

    _accessToken = client.credentials.accessToken;
    _client = client;
    return googleVision;
  }

  ///Run image detection and annotation for a batch of images.
  Future<BatchAnnotateImagesResponse> annotate(
      List<AnnotateImageRequest> requests) async {
    assert(_accessToken != null);
    assert(_client != null);

    VisionApi _vision = VisionApi(_client!);
    ImagesResource _api = _vision.images;
    return _api.annotate(BatchAnnotateImagesRequest(requests: requests));
  }

  ///draw [text] on the [Image] at the [x] and [y] position
  static void drawText(VisionImage visionImage, int x, int y, String text) {
    visionImage.drawString(x, y, text);
  }
}
