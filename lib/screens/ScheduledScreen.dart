import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduledScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 200,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              Icon(
                Icons.navigate_before,
                size: 30,
                color: Colors.blue[800],
              ),
              Text(
                "Lists",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue[800],
                ),
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("This is the Scheduled Screen"),
            ),
            FlatButton(
                onPressed: () {
                  Get.defaultDialog(
                      title: "Hey",
                      content: Text("Are you sure?"),
                      actions: [
                        Text("yes"),
                        Text("No"),
                      ],
                      radius: 5);
                },
                child: Text("Open Modal")),
          ],
        ),
      ),
    );
  }
}
