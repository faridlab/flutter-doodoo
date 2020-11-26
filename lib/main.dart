import 'package:flutter/material.dart';
import 'router/router.dart' as router;

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
      onGenerateRoute: router.generateRoute,
      // routes: RouterApp(context: context).routes
    );
  }
}
