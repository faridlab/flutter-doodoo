// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Tasks on _Tasks, Store {
  Computed<int> _$countTasksComputed;

  @override
  int get countTasks => (_$countTasksComputed ??=
          Computed<int>(() => super.countTasks, name: '_Tasks.countTasks'))
      .value;
  Computed<ObservableList<Task>> _$pendingTodosComputed;

  @override
  ObservableList<Task> get pendingTodos => (_$pendingTodosComputed ??=
          Computed<ObservableList<Task>>(() => super.pendingTodos,
              name: '_Tasks.pendingTodos'))
      .value;
  Computed<ObservableList<Task>> _$completedTodosComputed;

  @override
  ObservableList<Task> get completedTodos => (_$completedTodosComputed ??=
          Computed<ObservableList<Task>>(() => super.completedTodos,
              name: '_Tasks.completedTodos'))
      .value;
  Computed<bool> _$hasCompletedTodosComputed;

  @override
  bool get hasCompletedTodos => (_$hasCompletedTodosComputed ??= Computed<bool>(
          () => super.hasCompletedTodos,
          name: '_Tasks.hasCompletedTodos'))
      .value;
  Computed<bool> _$hasPendingTodosComputed;

  @override
  bool get hasPendingTodos =>
      (_$hasPendingTodosComputed ??= Computed<bool>(() => super.hasPendingTodos,
              name: '_Tasks.hasPendingTodos'))
          .value;
  Computed<String> _$itemsDescriptionComputed;

  @override
  String get itemsDescription => (_$itemsDescriptionComputed ??=
          Computed<String>(() => super.itemsDescription,
              name: '_Tasks.itemsDescription'))
      .value;
  Computed<ObservableList<Task>> _$visibleTodosComputed;

  @override
  ObservableList<Task> get visibleTodos => (_$visibleTodosComputed ??=
          Computed<ObservableList<Task>>(() => super.visibleTodos,
              name: '_Tasks.visibleTodos'))
      .value;
  Computed<bool> _$canRemoveAllCompletedComputed;

  @override
  bool get canRemoveAllCompleted => (_$canRemoveAllCompletedComputed ??=
          Computed<bool>(() => super.canRemoveAllCompleted,
              name: '_Tasks.canRemoveAllCompleted'))
      .value;
  Computed<bool> _$canMarkAllCompletedComputed;

  @override
  bool get canMarkAllCompleted => (_$canMarkAllCompletedComputed ??=
          Computed<bool>(() => super.canMarkAllCompleted,
              name: '_Tasks.canMarkAllCompleted'))
      .value;

  final _$tasksAtom = Atom(name: '_Tasks.tasks');

  @override
  ObservableList<Task> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<Task> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  final _$filterAtom = Atom(name: '_Tasks.filter');

  @override
  VisibilityFilter get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(VisibilityFilter value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$_TasksActionController = ActionController(name: '_Tasks');

  @override
  void addTask(Task task) {
    final _$actionInfo =
        _$_TasksActionController.startAction(name: '_Tasks.addTask');
    try {
      return super.addTask(task);
    } finally {
      _$_TasksActionController.endAction(_$actionInfo);
    }
  }

  @override
  Task getTaskByID(int id) {
    final _$actionInfo =
        _$_TasksActionController.startAction(name: '_Tasks.getTaskByID');
    try {
      return super.getTaskByID(id);
    } finally {
      _$_TasksActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTodo(String title) {
    final _$actionInfo =
        _$_TasksActionController.startAction(name: '_Tasks.addTodo');
    try {
      return super.addTodo(title);
    } finally {
      _$_TasksActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTodo(Task todo) {
    final _$actionInfo =
        _$_TasksActionController.startAction(name: '_Tasks.removeTodo');
    try {
      return super.removeTodo(todo);
    } finally {
      _$_TasksActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCompleted() {
    final _$actionInfo =
        _$_TasksActionController.startAction(name: '_Tasks.removeCompleted');
    try {
      return super.removeCompleted();
    } finally {
      _$_TasksActionController.endAction(_$actionInfo);
    }
  }

  @override
  void markAllAsCompleted() {
    final _$actionInfo =
        _$_TasksActionController.startAction(name: '_Tasks.markAllAsCompleted');
    try {
      return super.markAllAsCompleted();
    } finally {
      _$_TasksActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks},
filter: ${filter},
countTasks: ${countTasks},
pendingTodos: ${pendingTodos},
completedTodos: ${completedTodos},
hasCompletedTodos: ${hasCompletedTodos},
hasPendingTodos: ${hasPendingTodos},
itemsDescription: ${itemsDescription},
visibleTodos: ${visibleTodos},
canRemoveAllCompleted: ${canRemoveAllCompleted},
canMarkAllCompleted: ${canMarkAllCompleted}
    ''';
  }
}
