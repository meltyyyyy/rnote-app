import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token {

  Token(
      {required this.accessToken,
        required this.expiresIn,
        this.scope,
        required this.tokenType,
        this.refreshToken});

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
  @JsonKey(name: 'access_token')
  String accessToken;
  @JsonKey(name: 'expires_in')
  int expiresIn;
  String? scope;
  @JsonKey(name: 'token_type')
  String tokenType;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
