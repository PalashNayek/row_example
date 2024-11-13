import 'package:flutter/material.dart';

class RowViewModel extends ChangeNotifier {
  // List of icons or text to display in the Row
  List<Widget> _items = [
    Icon(Icons.access_alarm),
    Icon(Icons.accessibility),
    Icon(Icons.account_box),
  ];

  List<Widget> get items => _items;

  void addItem(Widget item) {
    _items.add(item);
    notifyListeners();  // Notify the UI to update
  }

  void removeItem(Widget item) {
    _items.remove(item);
    notifyListeners();  // Notify the UI to update
  }
}
