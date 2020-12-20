// import 'package:flutter/material.dart';
import '../screens/screens.dart';

List routes = [
  {'path': '/', 'screen': () => HomeScreen()},
  // ROUTES: Tasks
  {'path': '/tasks', 'screen': () => TaskIndex()},
  {'path': '/task/create', 'screen': () => TaskCreate()},
  {'path': '/task/detail', 'screen': () => TaskShow()},
  {'path': '/task/edit', 'screen': () => TaskEdit()},
  {'path': '/login', 'screen': () => LoginScreen()},
  {'path': '*', 'screen': () => NotfoundScreen()}
];
