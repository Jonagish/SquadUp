import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? latLongToString(LatLng? inputLocation) {
  // return inputLocation as string
  if (inputLocation == null) {
    return null; // Return null if inputLocation is null
  }
  return '${inputLocation.latitude}, ${inputLocation.longitude}'; // Return formatted string
}

List<LatLng>? listDoubleToLatLng(
  List<double>? latitude,
  List<double>? longitude,
) {
  // return latitude and longitude combined
  if (latitude == null ||
      longitude == null ||
      latitude.length != longitude.length) {
    return null; // Return null if any list is null or lengths do not match
  }

  List<LatLng> latLngList = [];
  for (int i = 0; i < latitude.length; i++) {
    latLngList.add(LatLng(latitude[i],
        longitude[i])); // Create LatLng objects and add to the list
  }

  return latLngList; // Return the list of LatLng objects
}

String? getFirstAddress(List<String>? addresses) {
  // get the first address of a list of addresses
  if (addresses == null || addresses.isEmpty) {
    return null; // Return null if addresses list is null or empty
  }
  return addresses.first; // Return the first address in the list
}

LatLng? doublesToLatLng(
  double? latitude,
  double? longitude,
) {
  // convert arguments from doubles to latitue and longitude datat type
  // Convert doubles to LatLng type
  if (latitude == null || longitude == null) {
    return null; // Return null if either latitude or longitude is null
  }
  return LatLng(latitude, longitude); // Return a new LatLng object
}

String? removeZIPandCOUNTRYTAG(String? address) {
// this functions removes the zip code and country tag of a given address
  if (address == null) {
    return null; // Return null if address is null
  }
  // Split the address by commas and remove the last two elements (zip code and country)
  List<String> addressParts = address.split(',');
  if (addressParts.length <= 2) {
    return address; // Return original address if it has 2 or fewer parts
  }
  return addressParts
      .sublist(0, addressParts.length - 2)
      .join(',')
      .trim(); // Join remaining parts and return
}
