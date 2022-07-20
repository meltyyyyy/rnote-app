import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/content/v2_1.dart';
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

  /// authenticate with Account
  static Future<GoogleTasks> withAccount() async {
    final GoogleTasks googleTasks = GoogleTasks();

    final List<String> scopes = <String>[TasksApi.tasksScope];
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: scopes);
    googleSignIn.signIn();

    final GoogleSignInAuthentication? googleAuth = await googleSignIn.currentUser?.authentication;
    final accountCredentials = AccountCredentials();

    _accessToken = client.credentials.accessToken;
    _client = client;
    return googleTasks;
  }

  Future<TaskLists> test(){
    assert(_accessToken != null);
    assert(_client != null);

    final TasksApi _tasks = TasksApi(_client!);
    final  TasklistsResource _api = _tasks.tasklists;
    return _api.list();
  }

  /// Get on a collection URI.
  Future<Tasks> list(String taskList) {
    assert(_accessToken != null);
    assert(_client != null);

    final TasksApi _tasks = TasksApi(_client!);
    final TasksResource _api = _tasks.tasks;
    return _api.list(taskList, maxResults: 10);
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
