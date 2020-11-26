// import 'package:flutter/material.dart';
import '../screens/screens.dart';

List routes = [
  {'path': '/', 'screen': () => HomeScreen()},
  {'path': '/login', 'screen': () => LoginScreen()},
  {'path': '*', 'screen': () => NotfoundScreen()}
];
