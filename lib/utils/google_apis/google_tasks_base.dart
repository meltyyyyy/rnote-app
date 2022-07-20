import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/tasks/v1.dart';
import 'package:googleapis_auth/googleapis_auth.dart';


class GoogleTasks {
  GoogleTasks();

  static AccessToken? _accessToken;
  static AuthClient? _client;

  String? get _token => _accessToken?.data;
  String? get _tokenType => _accessToken?.type;
  DateTime? get tokenExpiry => _accessToken?.expiry;

  /// authenticate with Account
  static Future<GoogleTasks> withAccount() async {
    final GoogleTasks googleTasks = GoogleTasks();

    final List<String> scopes = <String>[TasksApi.tasksScope];
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: scopes,
      clientId: dotenv.env['GOOGLE_TASKS_CLIENT_ID'],
    );

    if(await googleSignIn.isSignedIn() &&
        _client != null &&
    _accessToken != null){
      return googleTasks;
    }
    await googleSignIn.signIn();
    final  AuthClient? client = await googleSignIn.authenticatedClient();

    _accessToken = client?.credentials.accessToken;
    _client = client;
    return googleTasks;
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
