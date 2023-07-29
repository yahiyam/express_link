import 'package:flutter/material.dart';

class CheckboxSelection extends ChangeNotifier {
  bool _isAllSelected = false;
  bool get isAllSelected => _isAllSelected;

  onSelectedAll(bool? newValue, List items) {
    _isAllSelected = newValue ?? false;
    for (var item in items) {
      item.isSelected = _isAllSelected;
    }
    notifyListeners();
  }

  onCheckboxChanged(bool? newValue, int index, List items) {
    items[index].isSelected = newValue ?? false;
    _isAllSelected = items.every((item) => item.isSelected);
    notifyListeners();
  }
}
