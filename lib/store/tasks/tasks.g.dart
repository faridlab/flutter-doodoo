// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TaskList on _TaskList, Store {
  Computed<int> _$countTasksComputed;

  @override
  int get countTasks => (_$countTasksComputed ??=
          Computed<int>(() => super.countTasks, name: '_TaskList.countTasks'))
      .value;

  final _$tasksAtom = Atom(name: '_TaskList.tasks');

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

  final _$filterAtom = Atom(name: '_TaskList.filter');

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

  final _$_TaskListActionController = ActionController(name: '_TaskList');

  @override
  void addTask(Task task) {
    final _$actionInfo =
        _$_TaskListActionController.startAction(name: '_TaskList.addTask');
    try {
      return super.addTask(task);
    } finally {
      _$_TaskListActionController.endAction(_$actionInfo);
    }
  }

  @override
  Task getTaskByID(int id) {
    final _$actionInfo =
        _$_TaskListActionController.startAction(name: '_TaskList.getTaskByID');
    try {
      return super.getTaskByID(id);
    } finally {
      _$_TaskListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks},
filter: ${filter},
countTasks: ${countTasks}
    ''';
  }
}
