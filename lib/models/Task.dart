import 'package:meta/meta.dart';
import 'dart:math';

class Task {
  int id;
  bool urgent = false;
  bool important = false;
  String title;
  String description;
  String dueDate;
  bool done = false;

  Task({
    @required this.title,
    this.description,
    this.urgent,
    this.important,
    this.dueDate
  }) {
    var rng = new Random();
    this.id = rng.nextInt(100000);
  }

  Task.fromJson(Map<String, dynamic> json) {
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