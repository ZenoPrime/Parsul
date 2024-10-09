import '/backend/api_requests/api_calls.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_dupe_widget.dart' show HomeDupeWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class HomeDupeModel extends FlutterFlowModel<HomeDupeWidget> {
  ///  Local state fields for this page.

  bool recording = false;

  DateTime? startTime;

  bool responseReceived = false;

  bool responseSent = false;

  DateTime? endTime;

  String? file;

  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchSteps widget.
  PageController? searchStepsController;

  int get searchStepsCurrentIndex => searchStepsController != null &&
          searchStepsController!.hasClients &&
          searchStepsController!.page != null
      ? searchStepsController!.page!.round()
      : 0;
  String? audioRecord;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Backend Call - API (Speech to Text)] action in Recording widget.
  ApiCallResponse? apiRequestBuildship;
  AudioRecorder? audioRecorder;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
  }
}
