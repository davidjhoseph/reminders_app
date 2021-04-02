import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder_app/screens/ScheduledScreen.dart';
import 'package:reminder_app/widgets/home_screen/MenuBox.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text(
              "Edit",
              style: TextStyle(color: Colors.blue[600]),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
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
                        Get.to(() => ScheduledScreen());
                      },
                    ),
                    Spacer(),
                    MenuBox(
                      color: Colors.red[500],
                      numberCount: 7,
                      title: "Scheduled",
                      icon: Icons.schedule,
                      navigate: () {
                        Get.to(() => ScheduledScreen());
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    MenuBox(
                      color: Colors.grey[800],
                      numberCount: 14,
                      title: "All",
                      icon: Icons.store,
                      navigate: () {
                        Get.to(() => ScheduledScreen());
                      },
                    ),
                    Spacer(),
                    MenuBox(
                      color: Colors.orange[600],
                      numberCount: 1,
                      title: "Flagged",
                      icon: Icons.flag,
                      navigate: () {
                        Get.to(() => ScheduledScreen());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
