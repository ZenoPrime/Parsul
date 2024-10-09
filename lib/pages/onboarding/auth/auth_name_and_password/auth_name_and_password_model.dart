import '/flutter_flow/flutter_flow_util.dart';
import 'auth_name_and_password_widget.dart' show AuthNameAndPasswordWidget;
import 'package:flutter/material.dart';

class AuthNameAndPasswordModel
    extends FlutterFlowModel<AuthNameAndPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
