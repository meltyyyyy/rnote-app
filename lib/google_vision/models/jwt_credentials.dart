import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'json_settings.dart';

part 'jwt_credentials.g.dart';

@JsonSerializable(explicitToJson: true)
class JwtCredentials {
  JwtCredentials({required this.settings, required this.scope});

  factory JwtCredentials.fromJson(Map<String, dynamic> json) =>
      _$JwtCredentialsFromJson(json);
  final JsonSettings settings;
  final String scope;

  Map<String, dynamic> toJson() => _$JwtCredentialsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
