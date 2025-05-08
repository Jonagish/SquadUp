import '/components/message_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/nav_bar_with_middle_button/nav_bar_with_middle_button_widget.dart';
import '/index.dart';
import 'messages_widget.dart' show MessagesWidget;
import 'package:flutter/material.dart';

class MessagesModel extends FlutterFlowModel<MessagesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MessageComponent component.
  late MessageComponentModel messageComponentModel;
  // Model for NavBarWithMiddleButton component.
  late NavBarWithMiddleButtonModel navBarWithMiddleButtonModel;

  @override
  void initState(BuildContext context) {
    messageComponentModel = createModel(context, () => MessageComponentModel());
    navBarWithMiddleButtonModel =
        createModel(context, () => NavBarWithMiddleButtonModel());
  }

  @override
  void dispose() {
    messageComponentModel.dispose();
    navBarWithMiddleButtonModel.dispose();
  }
}
