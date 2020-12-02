// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Task on _Task, Store {
  final _$idAtom = Atom(name: '_Task.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$urgentAtom = Atom(name: '_Task.urgent');

  @override
  bool get urgent {
    _$urgentAtom.reportRead();
    return super.urgent;
  }

  @override
  set urgent(bool value) {
    _$urgentAtom.reportWrite(value, super.urgent, () {
      super.urgent = value;
    });
  }

  final _$importantAtom = Atom(name: '_Task.important');

  @override
  bool get important {
    _$importantAtom.reportRead();
    return super.important;
  }

  @override
  set important(bool value) {
    _$importantAtom.reportWrite(value, super.important, () {
      super.important = value;
    });
  }

  final _$titleAtom = Atom(name: '_Task.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_Task.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$dueDateAtom = Atom(name: '_Task.dueDate');

  @override
  String get dueDate {
    _$dueDateAtom.reportRead();
    return super.dueDate;
  }

  @override
  set dueDate(String value) {
    _$dueDateAtom.reportWrite(value, super.dueDate, () {
      super.dueDate = value;
    });
  }

  final _$doneAtom = Atom(name: '_Task.done');

  @override
  bool get done {
    _$doneAtom.reportRead();
    return super.done;
  }

  @override
  set done(bool value) {
    _$doneAtom.reportWrite(value, super.done, () {
      super.done = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
urgent: ${urgent},
important: ${important},
title: ${title},
description: ${description},
dueDate: ${dueDate},
done: ${done}
    ''';
  }
}
