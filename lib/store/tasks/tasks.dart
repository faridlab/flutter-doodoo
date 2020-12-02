import 'package:mobx/mobx.dart';
import 'task.dart';
part 'tasks.g.dart';

enum VisibilityFilter { all, pending, completed }

class TaskList = _TaskList with _$TaskList;

abstract class _TaskList with Store {
  @observable
  ObservableList<Task> tasks = ObservableList<Task>();

  @observable
  VisibilityFilter filter = VisibilityFilter.all;

  _TaskList({this.tasks});

  @action
  void addTask(Task task) {
    tasks.add(task);
  }

  @computed
  int get countTasks => tasks.length;

  @action
  Task getTaskByID(int id) {
    return tasks.firstWhere((task) => task.id == id);
  }
}
