import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _sportTypeFILTER = '';
  String get sportTypeFILTER => _sportTypeFILTER;
  set sportTypeFILTER(String value) {
    _sportTypeFILTER = value;
  }

  List<String> _sportFilter = [
    'Baskeball',
    'Soccer',
    'Volleyball',
    'Baseball',
    'Football',
    'Tennis',
    'Softball'
  ];
  List<String> get sportFilter => _sportFilter;
  set sportFilter(List<String> value) {
    _sportFilter = value;
  }

  void addToSportFilter(String value) {
    sportFilter.add(value);
  }

  void removeFromSportFilter(String value) {
    sportFilter.remove(value);
  }

  void removeAtIndexFromSportFilter(int index) {
    sportFilter.removeAt(index);
  }

  void updateSportFilterAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    sportFilter[index] = updateFn(_sportFilter[index]);
  }

  void insertAtIndexInSportFilter(int index, String value) {
    sportFilter.insert(index, value);
  }
}
