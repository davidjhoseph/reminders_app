import 'package:reminder_app/Models/ReminderDetails.dart';
import 'package:reminder_app/Models/SingleList.dart';

class Reminder {
  SingleList list;
  String title;
  String notes;
  ReminderDetails details;
  Reminder({
    this.list,
    this.title,
    this.notes,
    this.details,
  });
}
