import 'package:flutter/cupertino.dart';

class Todo {
  bool urgent = false;
  bool important = false;
  String title;
  String description;
  String dueDate;

  List<String> allAnswers;

  Todo({
    @required this.title,
    this.description,
    this.urgent,
    this.important,
    this.dueDate
  });

  Todo.fromJson(Map<String, dynamic> json) {
    urgent = json['urgent'];
    important = json['important'];
    urgent = json['urgent'];
    title = json['title'];
    description = json['description'];
    dueDate = json['dueDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['urgent'] = this.urgent;
    data['important'] = this.important;
    data['urgent'] = this.urgent;
    data['title'] = this.title;
    data['dueDate'] = this.dueDate;
    data['description'] = this.description;
    return data;
  }
}