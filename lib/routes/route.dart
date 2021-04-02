import 'package:flutter/material.dart';
import 'package:reminder_app/screens/HomeScreen.dart';
import 'package:reminder_app/screens/ScheduledScreen.dart';
import './route_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Home:
      return MaterialPageRoute(builder: (_) => HomeScreen());
    case ScheduledScreen.routeName:
      return MaterialPageRoute(builder: (_) => ScheduledScreen());
  }
}
