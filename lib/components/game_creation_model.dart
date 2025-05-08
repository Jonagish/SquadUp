import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'game_creation_widget.dart' show GameCreationWidget;
import 'package:flutter/material.dart';

class GameCreationModel extends FlutterFlowModel<GameCreationWidget> {
  ///  Local state fields for this component.

  String cardIMG =
      'https://img.freepik.com/free-photo/abstract-surface-textures-white-concrete-stone-wall_74190-8189.jpg';

  LatLng? cords;

  String markerAddress = 'Game Address';

  List<String> markerAddresses = [];
  void addToMarkerAddresses(String item) => markerAddresses.add(item);
  void removeFromMarkerAddresses(String item) => markerAddresses.remove(item);
  void removeAtIndexFromMarkerAddresses(int index) =>
      markerAddresses.removeAt(index);
  void insertAtIndexInMarkerAddresses(int index, String item) =>
      markerAddresses.insert(index, item);
  void updateMarkerAddressesAtIndex(int index, Function(String) updateFn) =>
      markerAddresses[index] = updateFn(markerAddresses[index]);

  List<LatLng> generatedListOfAddress = [];
  void addToGeneratedListOfAddress(LatLng item) =>
      generatedListOfAddress.add(item);
  void removeFromGeneratedListOfAddress(LatLng item) =>
      generatedListOfAddress.remove(item);
  void removeAtIndexFromGeneratedListOfAddress(int index) =>
      generatedListOfAddress.removeAt(index);
  void insertAtIndexInGeneratedListOfAddress(int index, LatLng item) =>
      generatedListOfAddress.insert(index, item);
  void updateGeneratedListOfAddressAtIndex(
          int index, Function(LatLng) updateFn) =>
      generatedListOfAddress[index] = updateFn(generatedListOfAddress[index]);

  UsersRecord? userInf;

  LatLng? userLocation;

  String categories = '0';

  ///  State fields for stateful widgets in this component.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Backend Call - API (cordsToAddress)] action in GoogleMap widget.
  ApiCallResponse? cordsToAddResult;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Backend Call - API (fourSquarePlaces)] action in DropDown widget.
  ApiCallResponse? fourSquarePlaces;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - API (addressToCords)] action in IconButton widget.
  ApiCallResponse? cordsFromAdd;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
