import 'dart:convert';

import 'package:crypto_keys/crypto_keys.dart';
import 'package:dio/dio.dart';
import 'package:jose/jose.dart';

import 'clients/oauth.dart';
import 'models/jwt_credentials.dart';
import 'models/token.dart';
import 'util/utils.dart';

abstract class TokenGenerator {
  Future<Token> generate();
}

class JwtGenerator implements TokenGenerator {
  JwtGenerator(
      {required this.jsonCredentials, required this.scope, required this.dio})
      : jwtCredentials = JwtCredentials.fromJson(<String, dynamic>{
          'settings': jsonDecode(jsonCredentials),
          'scope': scope
        });

  final String jsonCredentials;
  final String scope;
  final Dio dio;

  final JwtCredentials jwtCredentials;

  ///generate a OAuth2 refresh token from JWT credentials
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
