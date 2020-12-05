import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:mobx/mobx.dart';
import 'package:meta/meta.dart';
import 'dart:math';
part 'task.g.dart';

@jsonSerializable
@Json(allowCircularReferences: 1)
class Task extends _Task with _$Task {
  String title;
  Task({@required this.title});
}

abstract class _Task with Store {
  @observable
  int id;
  @observable
  bool urgent = false;
  @observable
  bool important = false;
  @observable
  String title;
  @observable
  String description;
  @observable
  String dueDate;
  @observable
  bool done = false;

  _Task({@required this.title}) {
    var rng = new Random();
    this.id = rng.nextInt(100000);
  }

  void fromJson(Map<String, dynamic> json) {
    urgent = json['urgent'];
    important = json['important'];
    urgent = json['urgent'];
    title = json['title'];
    description = json['description'];
    dueDate = json['dueDate'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['urgent'] = this.urgent;
    data['important'] = this.important;
    data['urgent'] = this.urgent;
    data['title'] = this.title;
    data['dueDate'] = this.dueDate;
    data['description'] = this.description;
    data['done'] = this.done;
    return data;
  }
}
