import 'package:googleapis/tasks/v1.dart';

import 'google_apis/google_tasks_base.dart';

class TaskController {
  TaskController();

  Future<void> fetchTasks() async {
    final GoogleTasks googleTasks = await GoogleTasks.withAccount();

    final TaskLists test = await googleTasks.test();

    for (TaskList taskList in test.items ?? <TaskList>[]){
      print(taskList.id);
      print(taskList.title);
    }
  }
}