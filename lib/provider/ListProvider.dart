import 'package:flutter/material.dart';
import 'package:reminder_app/Models/SingleList.dart';

class ListProvider extends ChangeNotifier {
  List<SingleList> _lists = [
    SingleList(color: Colors.orange[500], icon: Icons.ac_unit)
  ];
  String _greet = "Salo";
  List<SingleList> get lists {
    return [..._lists];
  }

  String get greet {
    return _greet;
  }

  changeGreeting(string) {
    _greet = string;
    notifyListeners();
  }
}
