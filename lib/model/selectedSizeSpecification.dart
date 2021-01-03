import 'package:flutter/material.dart';

class SelectedSizeSpecifications extends ChangeNotifier {
  String _selectedSize;

  setSelectedSize(String size) {
    this._selectedSize = size;
    notifyListeners();
  }

  get selectedSize => this._selectedSize;
}
