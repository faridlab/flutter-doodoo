import 'package:flutter/material.dart';
import 'router/routes.dart';

void main() {
  runApp(DoodooApp());
}

class DoodooApp extends StatelessWidget {
  final appTitle = 'Doodoo App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: appTitle,
        initialRoute: '/',
        routes: RouterApp(context: context).routes);
  }
}
