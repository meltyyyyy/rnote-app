import 'dart:convert';
import 'dart:io';

import 'package:crypto_keys/crypto_keys.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_vision/google_vision.dart';
import 'package:google_vision/src/model/localized_object_annotation.dart';
import 'package:jose/jose.dart';

class TextRecognizer {
  Image? croppedImage;
  Image? labeledImage;

  final String _jwt = dotenv.env['GOOGLE_APPLICATION_CREDENTIALS']!;
  static final Dio dio = Dio();

  void readJson(String filePath) async {
    const String scope = 'https://www.googleapis.com/auth/cloud-vision';
    Generator(credentialsFile: _jwt, scope: scope, dio: dio);
  }

  Future<Image?> annotate(String filePath) async {
    // GoogleVision.withGenerator();
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

class Generator implements TokenGenerator {
  Generator(
      {required this.credentialsFile, required this.scope, required this.dio})
      : jwtCredentials = JwtCredentials.fromJson(<String, dynamic>{
          'settings': jsonDecode(File(credentialsFile).readAsStringSync()),
          'scope': scope
        });

  final JwtCredentials jwtCredentials;
  final Dio dio;
  final String credentialsFile;
  final String scope;

  @override
  Future<Token> generate() {
    final JsonWebKey key =
        JsonWebKey.fromPem(jwtCredentials.settings.privateKey);

    final KeyPair privateKey = key.cryptoKeyPair;

    final Signer<PrivateKey> signer =
        privateKey.createSigner(algorithms.signing.rsa.sha256);

    final String header =
        Util.base64GCloudString('{"alg":"RS256","typ":"JWT"}');

    final String claim = Util.base64GCloudString(
        '{"iss": "${jwtCredentials.settings.clientEmail}","scope": "${jwtCredentials.scope}","aud": "https://www.googleapis.com/oauth2/v4/token", "exp": ${Util.unixTimeStamp(DateTime.now().add(Duration(seconds: 3599)))},"iat": ${Util.unixTimeStamp(DateTime.now())}}');

    final Signature signature = signer.sign('$header.$claim'.codeUnits);

    final String jwt =
        '$header.$claim.${Util.base64GCloudList(signature.data)}';

    final OAuthClient oAuthClient = OAuthClient(dio);

    return oAuthClient.getToken(<String, dynamic>{
      'grant_type': 'urn:ietf:params:oauth:grant-type:jwt-bearer',
      'assertion': jwt
    });
  }
}
