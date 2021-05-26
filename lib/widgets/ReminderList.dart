import 'package:flutter/material.dart';

class ReminderList extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final List reminders;
  ReminderList(
      {@required this.color,
      @required this.icon,
      this.reminders,
      @required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        children: [
          CircleAvatar(
              backgroundColor: color,
              radius: 18,
              child: Icon(
                icon,
                size: 25,
                color: Colors.white,
              )),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Spacer(),
          reminders.isNotEmpty ? Text(reminders.length.toString()) : SizedBox(),
          SizedBox(width: 10),
          Row(
            children: [
              Text(
                "13",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              // const SizedBox(width: 3),
              Icon(Icons.chevron_right_outlined, color: Colors.grey),
            ],
          )
        ],
      ),
    );
  }
}
