import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reminder_app/provider/ReminderProvider.dart';
import 'package:reminder_app/screens/add_list_screen.dart';
import 'package:reminder_app/screens/all_screen.dart';
import 'package:reminder_app/screens/flagged_screen.dart';
import 'package:reminder_app/screens/scheduled_screen.dart';
import 'package:reminder_app/screens/single_list_screen.dart';
import 'package:reminder_app/screens/today_screen.dart';
import 'package:reminder_app/widgets/ReminderList.dart';
import 'package:reminder_app/widgets/home_screen/MenuBox.dart';

final reminderProvider = Provider((ref) => ReminderProvider());

class HomeScreen extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Edit",
              style: TextStyle(color: Colors.blue[600]),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.grey[600],
                            ),
                            SizedBox(width: 3),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration.collapsed(
                                  hintText: "Search",
                                  hintStyle: TextStyle(color: Colors.grey[600]),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => print("tapped Microphone"),
                              child: Icon(
                                Icons.mic,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          MenuBox(
                            color: Colors.blue[800],
                            numberCount: 5,
                            title: "Today",
                            icon: Icons.calendar_today,
                            navigate: () {
                              Navigator.of(context)
                                  .pushNamed(TodayScreen.routeName);
                            },
                          ),
                          Spacer(),
                          MenuBox(
                            color: Colors.red[500],
                            numberCount: 7,
                            title: "Scheduled",
                            icon: CupertinoIcons.calendar,
                            navigate: () {
                              Navigator.of(context)
                                  .pushNamed(ScheduledScreen.routeName);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          MenuBox(
                            color: Colors.grey[800],
                            numberCount: 14,
                            title: "All",
                            icon: CupertinoIcons.tray_fill,
                            navigate: () {
                              Navigator.of(context)
                                  .pushNamed(AllScreen.routeName);
                            },
                          ),
                          Spacer(),
                          MenuBox(
                            color: Colors.orange[600],
                            numberCount: 1,
                            title: "Flagged",
                            icon: CupertinoIcons.flag_fill,
                            navigate: () {
                              Navigator.of(context)
                                  .pushNamed(FlaggedScreen.routeName);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "My Lists",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 10),
                      Consumer(
                        builder: (context, watch, child) {
                          final response = watch(reminderProvider);
                          return response.lists.isEmpty
                              ? Text("No List Yet")
                              : Column(
                                  children: [
                                    ...response.lists
                                        .map(
                                          (e) => GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pushNamed(
                                                  SingleListScreen.routeName);
                                            },
                                            child: ReminderList(
                                              color: e.color,
                                              icon: e.icon,
                                              title: e.title,
                                              reminders: e.reminders,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ],
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Scaffold.of(context).showBottomSheet<void>(
                      (BuildContext context) {
                        return Center(
                          child: Text("New Reminder"),
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.add),
                        radius: 12,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "New Reminder",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () async {
                    return Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => AddListScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Add List",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
