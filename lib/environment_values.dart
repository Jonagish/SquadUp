import 'dart:convert';
import 'package:flutter/services.dart';

class FFDevEnvironmentValues {
  static const String currentEnvironment = 'Production';
  static const String environmentValuesPath =
      'assets/environment_values/environment.json';

  static final FFDevEnvironmentValues _instance =
      FFDevEnvironmentValues._internal();

  factory FFDevEnvironmentValues() {
    return _instance;
  }

  FFDevEnvironmentValues._internal();

  Future<void> initialize() async {
    try {
      final String response =
          await rootBundle.loadString(environmentValuesPath);
      final data = await json.decode(response);
      _apiURLNearbyPlaces = data['apiURLNearbyPlaces'];
      _apiURLGeoCodeMaps = data['apiURLGeoCodeMaps'];
    } catch (e) {
      print('Error loading environment values: $e');
    }
  }

  String _apiURLNearbyPlaces = '';
  String get apiURLNearbyPlaces => _apiURLNearbyPlaces;

  String _apiURLGeoCodeMaps = '';
  String get apiURLGeoCodeMaps => _apiURLGeoCodeMaps;
}
