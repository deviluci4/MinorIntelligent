import 'package:flutter/cupertino.dart';

class DataProvider extends ChangeNotifier {
  dynamic _placesData = null;
  dynamic get getData => _placesData;

  void modifyData(dynamic d) {
    this._placesData = d;
    notifyListeners();
  }
}