import 'package:flutter/material.dart';
import 'package:reminder_app/Models/SingleList.dart';

class ReminderProvider extends ChangeNotifier {
  List<SingleList> _lists = [
    SingleList(
      color: Colors.orange[500],
      icon: Icons.ac_unit,
      title: "Reminders",
      reminders: [],
    ),
  ];
  List<Color> colors = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.blue,
    Colors.black,
    Colors.yellow,
    Colors.brown,
    Colors.cyan,
    Colors.deepOrange,
    Colors.blueGrey,
    Colors.teal,
    Colors.indigo,
  ];

  List<IconData> icons = [
    Icons.ac_unit,
    Icons.alarm,
    Icons.mic,
    Icons.offline_bolt,
    Icons.mail,
    Icons.radio,
    Icons.read_more,
    Icons.map,
    Icons.flag,
    Icons.label,
    Icons.cached,
    Icons.dangerous,
    Icons.dashboard,
    Icons.download_done_outlined,
    Icons.east,
    Icons.error,
    Icons.margin,
    Icons.padding,
    Icons.offline_bolt,
    Icons.iso_rounded,
    Icons.format_align_justify,
    Icons.opacity,
    Icons.pedal_bike,
    Icons.icecream,
    Icons.image,
    Icons.ac_unit,
    Icons.alarm,
    Icons.mic,
    Icons.offline_bolt,
    Icons.mail,
    Icons.radio,
    Icons.read_more,
    Icons.map,
    Icons.flag,
    Icons.label,
    Icons.cached,
    Icons.dangerous,
    Icons.dashboard,
    Icons.download_done_outlined,
    Icons.east,
    Icons.error,
    Icons.margin,
    Icons.padding,
    Icons.offline_bolt,
    Icons.iso_rounded,
    Icons.format_align_justify,
    Icons.opacity,
    Icons.pedal_bike,
    Icons.icecream,
    Icons.image,
  ];

  Color _selectedColor = Colors.blue[800];

  IconData _selectedIcon = Icons.ac_unit;

  String _selectedTitle = '';

  Color get selectedColor {
    return _selectedColor;
  }

  IconData get selectedIcon {
    return _selectedIcon;
  }

  String get selectedTitle {
    return _selectedTitle;
  }

  List<SingleList> get lists {
    return [..._lists];
  }

  void changeSelectedIcon(IconData icon) {
    _selectedIcon = icon;
    notifyListeners();
  }

  void changeSelectedColor(Color color) {
    _selectedColor = color;
    notifyListeners();
  }

  void changeSelectedTitle(String title) {
    _selectedTitle = title;
  }

  void addToList({IconData icon, String title, Color color}) {
    _lists.add(SingleList(color: color, title: title, icon: icon));
    print(_lists);
    notifyListeners();
  }
}
