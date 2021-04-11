import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:reminder_app/Models/SingleList.dart';
import 'package:reminder_app/provider/ReminderProvider.dart';

final reminderData = ChangeNotifierProvider((ref) => ReminderProvider());

class AddListScreen extends StatefulWidget {
  @override
  _AddListScreenState createState() => _AddListScreenState();
}

class _AddListScreenState extends State<AddListScreen> {
  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final response = watch(reminderData);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leadingWidth: 70,
            leading: TextButton(
              onPressed: () async {
                await Hive.close();
                Navigator.of(context).pop();
              },
              child: Text(
                "Cancel",
              ),
            ),
            title: Text(
              "New List",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            actions: [
              TextButton(
                onPressed: titleController.text.length < 1
                    ? null
                    : () {
                        final SingleList list = SingleList(
                          title: titleController.text,
                          color: response.selectedColor,
                          icon: response.selectedIcon,
                        );
                        Hive.box("reminderList").add(list);

                        // response.addToList(
                        //   icon: response.selectedIcon,
                        //   color: response.selectedColor,
                        //   title: titleController.text,
                        // );
                        Navigator.pop(context);
                      },
                child: Text(
                  "Done",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Align(
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: response.selectedColor,
                          child: Icon(
                            response.selectedIcon,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[300],
                        ),
                        child: TextField(
                          controller: titleController,
                          onChanged: (_) {
                            setState(() {});
                          },
                          decoration: InputDecoration.collapsed(hintText: ''),
                        ),
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Wrap(
                          // spacing: 5,
                          runSpacing: 5,
                          children: [
                            ...response.colors.map(
                              (e) => GestureDetector(
                                onTap: () {
                                  response.changeSelectedColor(e);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: response.selectedColor == e
                                            ? Colors.grey[400]
                                            : Colors.transparent,
                                        width: 2),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: e,
                                    radius: 25,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Wrap(
                          // spacing: 5,
                          runSpacing: 5,
                          children: [
                            ...response.icons.map(
                              (e) => GestureDetector(
                                onTap: () {
                                  response.changeSelectedIcon(e);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: response.selectedIcon == e
                                            ? Colors.grey[300]
                                            : Colors.transparent,
                                        width: 2),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey[200],
                                    child: Icon(
                                      e,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
