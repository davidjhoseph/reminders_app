import 'package:flutter/material.dart';
import 'package:reminder_app/screens/HomeScreen.dart';
import 'package:reminder_app/screens/ScheduledScreen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (_) => HomeScreen());
    case ScheduledScreen.routeName:
      return MaterialPageRoute(builder: (_) => ScheduledScreen());
    // default:
    //   return MaterialPageRoute(builder: (_) => HomeScreen());
  }
}
