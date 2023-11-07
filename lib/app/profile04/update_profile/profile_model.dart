import 'package:phrase_flow/app/profile04/update_profile/update_profile_page.dart'
    show UpdateAccount;
import 'package:phrase_flow/components/flutter_flow/flutter_flow_model.dart';
import 'package:phrase_flow/components/flutter_flow/form_field_controller.dart';

import 'package:flutter/material.dart';

class AddAnotherProfileModel extends FlutterFlowModel<UpdateAccount> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode1;
  TextEditingController? phoneNumberController1;
  String? Function(BuildContext, String?)? phoneNumberController1Validator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode2;
  TextEditingController? phoneNumberController2;
  String? Function(BuildContext, String?)? phoneNumberController2Validator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode3;
  TextEditingController? phoneNumberController3;
  String? Function(BuildContext, String?)? phoneNumberController3Validator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode4;
  TextEditingController? phoneNumberController4;
  String? Function(BuildContext, String?)? phoneNumberController4Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    phoneNumberFocusNode1?.dispose();
    phoneNumberController1?.dispose();

    phoneNumberFocusNode2?.dispose();
    phoneNumberController2?.dispose();

    phoneNumberFocusNode3?.dispose();
    phoneNumberController3?.dispose();

    phoneNumberFocusNode4?.dispose();
    phoneNumberController4?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
