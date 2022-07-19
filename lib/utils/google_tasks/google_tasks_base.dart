




import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:googleapis/tasks/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

class GoogleTasks {
  GoogleTasks();

  static AccessToken? _accessToken;
  static AutoRefreshingAuthClient? _client;

  String? get _token => _accessToken?.data;
  String? get _tokenType => _accessToken?.type;
  DateTime? get tokenExpiry => _accessToken?.expiry;

  /// authenticate with jwt
  static Future<GoogleTasks> withJwt(String jwtPath) async {
    final GoogleTasks googleTasks = GoogleTasks();

    String _json = await rootBundle.loadString(jwtPath);
    ServiceAccountCredentials accountCredentials =
    ServiceAccountCredentials.fromJson(jsonDecode(_json));
    List<String> scopes = <String>[TasksApi.tasksScope];
    AutoRefreshingAuthClient client =
    await clientViaServiceAccount(accountCredentials, scopes);

    _accessToken = client.credentials.accessToken;
    _client = client;
    return googleTasks;
  }


}