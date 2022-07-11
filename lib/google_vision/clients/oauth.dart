
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../models/token.dart';

part 'oauth.g.dart';

@RestApi(baseUrl: 'https://accounts.google.com/o/oauth2')
abstract class OAuthClient {
  factory OAuthClient(Dio dio, {String baseUrl}) = _OAuthClient;

  @POST('/token')
  @Headers(
      <String, dynamic>{'Content-Type': 'application/x-www-form-urlencoded'})
  Future<Token> getToken(@Body() Map<String, dynamic> params);
}
