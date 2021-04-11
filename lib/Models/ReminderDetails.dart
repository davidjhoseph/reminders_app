import 'package:flutter/material.dart';
import 'package:reminder_app/Models/SingleList.dart';

class ReminderDetails {
  SingleList list;
  DateTime date;
  TimeOfDay time;
  String title;
  String notes;
  String url;
  String location;
  bool flag;
  int priority;
  List<String> subtasks;
  String image;
  ReminderDetails({
    this.time,
    this.list,
    this.title,
    this.date,
    this.notes,
    this.flag,
    this.image,
    this.location,
    this.priority,
    this.subtasks,
    this.url,
  });
}
