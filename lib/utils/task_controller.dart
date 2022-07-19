import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:googleapis/tasks/v1.dart';

import 'google_apis/google_tasks_base.dart';

class TaskController {
  TaskController()
      : assert(dotenv.env['GOOGLE_APPLICATION_CREDENTIALS'] != null);

  Future<void> fetchTasks(String taskList) async {
    final GoogleTasks googleTasks = await GoogleTasks.withJwt(
        dotenv.env['GOOGLE_APPLICATION_CREDENTIALS']!);

    final TaskLists test = await googleTasks.test();

    print(test.items?.first.id);
  }
}