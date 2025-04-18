import '/components/icon_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Icon component.
  late IconModel iconModel;

  @override
  void initState(BuildContext context) {
    iconModel = createModel(context, () => IconModel());
  }

  @override
  void dispose() {
    iconModel.dispose();
  }
}
