import 'package:flutter/material.dart';
import './routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  var route;
  try {
    route = routes.firstWhere((item) {
      // FIXME: find path by pattern
      return item['path'] == settings.name;
    });

    return MaterialPageRoute(
        builder: (BuildContext context) => route['screen']());
  } catch (e) {
    route = routes.firstWhere((item) {
      return item['path'] == '*';
    });

    return MaterialPageRoute(
        builder: (BuildContext context) => route['screen']());
  }
}
