import 'package:flutter/material.dart';
import 'package:phrase_flow/app/services/add_lesson/add_lesson_page.dart';

import '../../../components/flutter_flow/flutter_flow_model.dart';

class AddLessonModel extends FlutterFlowModel<AddLesson> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChoiceChips widget.

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }
}
