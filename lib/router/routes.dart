import 'package:flutter/material.dart';
import '../views/pages/home/home.dart';

// FIXME: make this router more clear
class RouterApp {
  BuildContext context;

  RouterApp({this.context});

  final routes = {
    '/': (context) => HomeTodoApp(),
    // '/task': () => {},
  };
}
