import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder_app/settings/Theme.dart';
import './routes/route.dart' as route;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        onGenerateRoute: route.generateRoute,
        theme: theme,
      ),
    );
  }
}
