

import 'package:color/color.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import 'clients/vision.dart';
import 'models/annotated_responses.dart';
import 'models/annotation_requests.dart';
import 'models/image.dart';
import 'models/normalized_vertex.dart';
import 'models/token.dart';
import 'models/vertex.dart';
import 'token_generator.dart';

class GoogleVision {

  GoogleVision() : _rest = VisionClient(dio);
  final VisionClient _rest;

  static final Dio dio = Dio();
  static final DateTime tokenExpiry = DateTime(2010, 0, 0);
  static const String accept = 'application/json';
  static const String contentType = 'application/json';

  static TokenGenerator? tokenGenerator;
  static String? _token;

  String get _authHeader => 'Bearer $_token';

  static Future<GoogleVision> withGenerator(TokenGenerator generator) async {
    final GoogleVision googleVision = GoogleVision();

    GoogleVision.tokenGenerator = generator;

    await _confirmToken();

    return googleVision;
  }

  ///authenticated with JWT
  static Future<GoogleVision> withJwt(String jwtPath,
      [String scope = 'https://www.googleapis.com/auth/cloud-vision']) async {
    GoogleVision yt = GoogleVision();
    String _jsonCredentials = await rootBundle.loadString(jwtPath);

    tokenGenerator =
        JwtGenerator(jsonCredentials: _jsonCredentials, scope: scope, dio: dio);

    await _confirmToken();

    return yt;
  }

  static Future<void> _confirmToken() async {
    if (tokenGenerator == null) {
      throw Exception();
    } else {
      if (tokenExpiry.isBefore(DateTime.now())) {
        final Token tokenData = await tokenGenerator!.generate();

        _token = tokenData.accessToken;

        tokenExpiry.add(Duration(seconds: tokenData.expiresIn));
      }
    }
  }

  ///Run image detection and annotation for a batch of images.
  Future<AnnotatedResponses> annotate({required AnnotationRequests requests}) {
    return _rest.annotate(_authHeader, contentType, requests.toJson());
  }

  ///draw a box on the supplied [Image] around detected object using [NormalizedVertex] values
  static void drawAnnotationsNormalized(
      Image image, List<NormalizedVertex> vertices,
      {String color = 'red', int thickness = 3}) {
    for (int index = 0; index < vertices.length - 1; index++) {
      final NormalizedVertex vStart = vertices[index];

      final NormalizedVertex vStop = vertices[index + 1];

      image.drawLine(
          (vStart.x * image.width).toInt(),
          (vStart.y * image.height).toInt(),
          (vStop.x * image.width).toInt(),
          (vStop.y * image.height).toInt(),
          RgbColor.name(color),
          thickness: thickness);
    }

    image.drawLine(
        (vertices.last.x * image.width).toInt(),
        (vertices.last.y * image.height).toInt(),
        (vertices.first.x * image.width).toInt(),
        (vertices.first.y * image.height).toInt(),
        RgbColor.name(color),
        thickness: thickness);
  }

  ///draw a box on the supplied [Image] around the detected object using [Vertex] values
  static void drawAnnotations(Image image, List<Vertex> vertices,
      {String color = 'red', int thickness = 3}) {
    for (int index = 0; index < vertices.length - 1; index++) {
      final Vertex vStart = vertices[index];

      final Vertex vStop = vertices[index + 1];

      image.drawLine(vStart.x, vStart.y, vStop.x, vStop.y, RgbColor.name(color),
          thickness: thickness);
    }

    image.drawLine(vertices.last.x, vertices.last.y, vertices.first.x,
        vertices.first.y, RgbColor.name(color),
        thickness: thickness);
  }

  ///draw [text] on the [Image] at the [x] and [y] position
  static void drawText(Image image, int x, int y, String text) {
    image.drawString(x, y, text);
  }
}

// class GoogleVision {
//   GoogleVision() : assert(dotenv.env['GOOGLE_APPLICATION_CREDENTIALS'] != null);
//
//   static AccessToken? _accessToken;
//   static AutoRefreshingAuthClient? _rest;
//
//   String? get _token => _accessToken?.data;
//   String? get _tokenType => _accessToken?.type;
//   DateTime? get tokenExpiry => _accessToken?.expiry;
//
//   /// authenticate with jwt
//   static Future<GoogleVision> withJwt(String jwtPath) async {
//     final GoogleVision googleVision = GoogleVision();
//     String _json = await rootBundle.loadString(jwtPath);
//     ServiceAccountCredentials accountCredentials =
//         ServiceAccountCredentials.fromJson(jsonDecode(_json));
//     List<String> scopes = <String>[VisionApi.cloudVisionScope];
//     AutoRefreshingAuthClient _client =
//         await clientViaServiceAccount(accountCredentials, scopes);
//
//     _accessToken = _client.credentials.accessToken;
//     _rest = _client;
//     return googleVision;
//   }
//
//   ///Run image detection and annotation for a batch of images.
//   Future<void> annotate(String image) async {
//     assert(_accessToken != null);
//     assert(_rest != null);
//
//     VisionApi _vision = VisionApi(_rest!);
//     ImagesResource _api = _vision.images;
//     BatchAnnotateImagesResponse response = await _api
//         .annotate(BatchAnnotateImagesRequest.fromJson(<String, dynamic>{
//       'requests': <Map<String, dynamic>>[
//         <String, dynamic>{
//           'image': <String, dynamic>{'content': image},
//           'features': <Map<String, dynamic>>[
//             <String, dynamic>{'type': 'DOCUMENT_TEXT_DETECTION'}
//           ]
//         }
//       ]
//     }));
//   }
// }
