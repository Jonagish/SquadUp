import '/flutter_flow/flutter_flow_util.dart';
import '/pages/nav_bar_with_middle_button/nav_bar_with_middle_button_widget.dart';
import '/index.dart';
import 'chat_home_widget.dart' show ChatHomeWidget;
import 'package:flutter/material.dart';

class ChatHomeModel extends FlutterFlowModel<ChatHomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBarWithMiddleButton component.
  late NavBarWithMiddleButtonModel navBarWithMiddleButtonModel;

  @override
  void initState(BuildContext context) {
    navBarWithMiddleButtonModel =
        createModel(context, () => NavBarWithMiddleButtonModel());
  }

  @override
  void dispose() {
    navBarWithMiddleButtonModel.dispose();
  }
}
