import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:reminder_app/Models/Reminder.dart';

part 'single_list.g.dart';

@HiveType(typeId: 1)
class SingleList {
  @HiveField(0)
  IconData icon;
  @HiveField(1)
  Color color;
  @HiveField(2)
  String title;
  @HiveField(3)
  List<Reminder> reminders;
  SingleList({this.color, this.icon, this.title, this.reminders});
}
