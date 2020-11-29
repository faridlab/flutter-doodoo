import 'package:meta/meta.dart';
import 'Task.dart';

class Tasks {
  List<Task> tasks = [];

  Tasks({
    this.tasks
  });

  void addTask(Task task) {
    tasks.add(task);
  }

  int countTasks() {
    return tasks.length;
  }

  Task getTaskByID(int id) {
    return tasks.firstWhere((task) => task.id == id);
  }

}