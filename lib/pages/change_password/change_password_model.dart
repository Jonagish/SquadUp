import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:flutter/material.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  Local state fields for this page.

  String? photoURL;

  ///  State fields for stateful widgets in this page.

  // State field(s) for newPass widget.
  FocusNode? newPassFocusNode;
  TextEditingController? newPassTextController;
  late bool newPassVisibility;
  String? Function(BuildContext, String?)? newPassTextControllerValidator;
  // State field(s) for confirmPass widget.
  FocusNode? confirmPassFocusNode;
  TextEditingController? confirmPassTextController;
  late bool confirmPassVisibility;
  String? Function(BuildContext, String?)? confirmPassTextControllerValidator;

  @override
  void initState(BuildContext context) {
    newPassVisibility = false;
    confirmPassVisibility = false;
  }

  @override
  void dispose() {
    newPassFocusNode?.dispose();
    newPassTextController?.dispose();

    confirmPassFocusNode?.dispose();
    confirmPassTextController?.dispose();
  }
}
