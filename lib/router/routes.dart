import 'package:flutter/material.dart';
import '../screens/pages/home/home.dart';

// FIXME: make this router more clear
class RouterApp {
  BuildContext context;

  RouterApp({this.context});

  final routes = {
    '/': (BuildContext context) => HomeTodoApp(),
    // '/task': () => {},
  };
}
