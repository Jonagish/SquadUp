import '/backend/backend.dart';
import '/components/game_card_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'map_view_copy_widget.dart' show MapViewCopyWidget;
import 'package:flutter/material.dart';

class MapViewCopyModel extends FlutterFlowModel<MapViewCopyWidget> {
  ///  Local state fields for this page.

  CreatedGamesRecord? docGames;

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for game_card component.
  late GameCardModel gameCardModel;

  @override
  void initState(BuildContext context) {
    gameCardModel = createModel(context, () => GameCardModel());
  }

  @override
  void dispose() {
    gameCardModel.dispose();
  }
}
