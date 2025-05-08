import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'invite_users_widget.dart' show InviteUsersWidget;
import 'package:flutter/material.dart';

class InviteUsersModel extends FlutterFlowModel<InviteUsersWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> newUsersAdded = [];
  void addToNewUsersAdded(DocumentReference item) => newUsersAdded.add(item);
  void removeFromNewUsersAdded(DocumentReference item) =>
      newUsersAdded.remove(item);
  void removeAtIndexFromNewUsersAdded(int index) =>
      newUsersAdded.removeAt(index);
  void insertAtIndexInNewUsersAdded(int index, DocumentReference item) =>
      newUsersAdded.insert(index, item);
  void updateNewUsersAddedAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      newUsersAdded[index] = updateFn(newUsersAdded[index]);

  bool isSearchActive = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
