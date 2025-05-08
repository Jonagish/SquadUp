import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class FindNearbySportsFieldsCall {
  static Future<ApiCallResponse> call({
    String? sport = '',
    String? lat = '',
    String? lng = '',
  }) async {
    final ffApiRequestBody = '''
{
  "sport": "${escapeStringForJson(sport)}",
  "lat": "${escapeStringForJson(lat)}",
  "lng": "${escapeStringForJson(lng)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'findNearbySportsFields',
      apiUrl: 'https://getnearbysportsfields-blwudw5m3a-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<double>? lat(dynamic response) => (getJsonField(
        response,
        r'''$.elements[:].lat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? long(dynamic response) => (getJsonField(
        response,
        r'''$.elements[:].lon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
}

class NearbyPlacesCall {
  static Future<ApiCallResponse> call({
    String? keyword,
    String? lating = '',
  }) async {
    keyword ??= 'OR sports+complex OR recreation+center';

    return ApiManager.instance.makeApiCall(
      callName: 'NearbyPlaces',
      apiUrl: 'https://maps.googleapis.com/maps/api/place/nearbysearch/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'key': "AIzaSyCRIvhrOkPOyRZUtledacKEuY5_D0TENUM",
        'radius': "32186.9",
        'type': "park",
        'location': lating,
        'keyword': keyword,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<double>? lat(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].geometry.location.lat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? lng(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].geometry.location.lng''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List? placePhotos(dynamic response) => getJsonField(
        response,
        r'''$.results[:].photos''',
        true,
      ) as List?;
  static List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].vicinity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CordsToAddressCall {
  static Future<ApiCallResponse> call({
    String? latlng = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'cordsToAddress',
      apiUrl: 'https://maps.googleapis.com/maps/api/geocode/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'latlng': latlng,
        'key': "AIzaSyCRIvhrOkPOyRZUtledacKEuY5_D0TENUM",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].formatted_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AddressToCordsCall {
  static Future<ApiCallResponse> call({
    String? address = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'addressToCords',
      apiUrl: 'https://maps.googleapis.com/maps/api/geocode/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'address': address,
        'key': "AIzaSyCRIvhrOkPOyRZUtledacKEuY5_D0TENUM",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? lat(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[:].geometry.location.lat''',
      ));
  static double? lng(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[:].geometry.location.lng''',
      ));
}

class TomTomNearbySearchCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'TomTomNearbySearch',
      apiUrl: 'https://api.tomtom.com/search/2/nearbySearch/.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FourSquarePlacesCall {
  static Future<ApiCallResponse> call({
    String? lat = '',
    String? lng = '',
    String? categories = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'fourSquarePlaces',
      apiUrl: 'https://getsportscourts-blwudw5m3a-uc.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'lat': lat,
        'lng': lng,
        'categories': categories,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<double>? latitude(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].geocodes.main.latitude''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? longitude(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].geocodes.main.longitude''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? venueName(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].location.formatted_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
