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

    final String _json = await rootBundle.loadString(jwtPath);
    final ServiceAccountCredentials accountCredentials =
        ServiceAccountCredentials.fromJson(jsonDecode(_json));
    final List<String> scopes = <String>[TasksApi.tasksScope];
    final AutoRefreshingAuthClient client =
        await clientViaServiceAccount(accountCredentials, scopes);

    _accessToken = client.credentials.accessToken;
    _client = client;
    return googleTasks;
  }

  /// Get on a collection URI.
  Future<Tasks> list(String taskList) async {
    assert(_accessToken != null);
    assert(_client != null);

    final TasksApi _tasks = TasksApi(_client!);
    final TasksResource _api = _tasks.tasks;
    return _api.list(taskList);
  }

  Future<Task> get(String taskList, String task) async {
    assert(_accessToken != null);
    assert(_client != null);

    final TasksApi _tasks = TasksApi(_client!);
    final TasksResource _api = _tasks.tasks;
    return _api.get(taskList, task);
  }

  Future<Task> insert(Task request, String taskList) async {
    assert(_accessToken != null);
    assert(_client != null);

    final TasksApi _tasks = TasksApi(_client!);
    final TasksResource _api = _tasks.tasks;
    return _api.insert(request, taskList);
  }

  Future<Task> update(Task request, String taskList, String task) async {
    assert(_accessToken != null);
    assert(_client != null);

    final TasksApi _tasks = TasksApi(_client!);
    final TasksResource _api = _tasks.tasks;
    return _api.update(request, taskList, task);
  }

  Future<void> delete(String taskList, String task) async {
    assert(_accessToken != null);
    assert(_client != null);

    final TasksApi _tasks = TasksApi(_client!);
    final TasksResource _api = _tasks.tasks;
    return _api.delete(taskList, task);
  }
}
