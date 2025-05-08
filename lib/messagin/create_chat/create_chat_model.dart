import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_chat_widget.dart' show CreateChatWidget;
import 'package:flutter/material.dart';

class CreateChatModel extends FlutterFlowModel<CreateChatWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> userAdded = [];
  void addToUserAdded(DocumentReference item) => userAdded.add(item);
  void removeFromUserAdded(DocumentReference item) => userAdded.remove(item);
  void removeAtIndexFromUserAdded(int index) => userAdded.removeAt(index);
  void insertAtIndexInUserAdded(int index, DocumentReference item) =>
      userAdded.insert(index, item);
  void updateUserAddedAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      userAdded[index] = updateFn(userAdded[index]);

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
