import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:googleapis/tasks/v1.dart';

import 'google_apis/google_tasks_base.dart';

class TaskController {
  TaskController() : assert(dotenv.env['GOOGLE_TASKS_CLIENT_ID'] != null);

  static const String _taskId = 'SmRROENTbmhHSkVyZG51bA';

  Future<List<Task>> fetchTasks() async {
    final GoogleTasks googleTasks = await GoogleTasks.withAccount();
    final Tasks tasks = await googleTasks.list(_taskId);
    return tasks.items ?? <Task>[];
  }

  Future<void> postTask(String title) async {
    final GoogleTasks googleTasks = await GoogleTasks.withAccount();

    final Task request = Task(title: title);
    googleTasks.insert(request, _taskId);
  }
}
