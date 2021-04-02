import 'package:flutter/material.dart';
import 'package:reminder_app/Models/SingleList.dart';

class ListProvider {
  List<SingleList> lists = [
    SingleList(color: Colors.orange[500], icon: Icons.ac_unit)
  ];
  String greet = "Manny";
  changeGreeting() {
    greet = "string";
  }
}
