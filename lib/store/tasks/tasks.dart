import 'package:mobx/mobx.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'task.dart';
part 'tasks.g.dart';

@jsonSerializable
enum VisibilityFilter { all, pending, completed }

@jsonSerializable
class Tasks extends _Tasks with _$Tasks {}

@jsonSerializable
abstract class _Tasks with Store {
  @observable
  ObservableList<Task> tasks = ObservableList<Task>();

  _Tasks({this.tasks});

  @computed
  int get countTasks => tasks == null ? 0 : tasks.length;

  @action
  Task getTaskByID(int id) {
    return tasks.firstWhere((task) => task.id == id);
  }

  @observable
  @JsonProperty(defaultValue: VisibilityFilter.all)
  VisibilityFilter filter;

  @computed
  ObservableList<Task> get pendingTodos =>
      ObservableList.of(tasks.where((todo) => todo.done != true));

  @computed
  ObservableList<Task> get completedTodos =>
      ObservableList.of(tasks.where((todo) => todo.done == true));

  @computed
  bool get hasCompletedTodos => completedTodos.isNotEmpty;

  @computed
  bool get hasPendingTodos => pendingTodos.isNotEmpty;

  @computed
  String get itemsDescription {
    if (tasks == null || tasks.isEmpty) {
      return "You have no remaining\ntasks for today!";
    }

    final suffix = pendingTodos.length == 1 ? 'todo' : 'todos';
    return '${pendingTodos.length} pending $suffix, ${completedTodos.length} completed';
  }

  @computed
  @JsonProperty(ignore: true)
  ObservableList<Task> get visibleTodos {
    switch (filter) {
      case VisibilityFilter.pending:
        return pendingTodos;
      case VisibilityFilter.completed:
        return completedTodos;
      default:
        return tasks;
    }
  }

  @computed
  bool get canRemoveAllCompleted =>
      hasCompletedTodos && filter != VisibilityFilter.pending;

  @computed
  bool get canMarkAllCompleted =>
      hasPendingTodos && filter != VisibilityFilter.completed;

  @action
  void addTask(String title) {
    final todo = Task(title: title);
    tasks.add(todo);
  }

  @action
  void removeTodo(Task todo) {
    tasks.removeWhere((x) => x == todo);
  }

  @action
  void removeCompleted() {
    tasks.removeWhere((todo) => todo.done);
  }

  @action
  void markAllAsCompleted() {
    for (final todo in tasks) {
      todo.done = true;
    }
  }
}
