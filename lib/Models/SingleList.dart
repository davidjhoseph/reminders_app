import 'package:flutter/material.dart';
import 'package:reminder_app/Models/Reminder.dart';

class SingleList {
  IconData icon;
  Color color;
  String title;
  List<Reminder> reminders;

  SingleList({this.color, this.icon, this.title, this.reminders});
}
