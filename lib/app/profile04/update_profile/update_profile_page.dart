import 'package:phrase_flow/app/global/theme/theme_mode.dart';
import 'package:phrase_flow/app/profile04/update_profile/profile_model.dart';
import 'package:phrase_flow/components/flutter_flow/flutter_flow_radio_button.dart';
import 'package:phrase_flow/components/flutter_flow/flutter_flow_util.dart';
import 'package:phrase_flow/components/flutter_flow/flutter_flow_widgets.dart';
import 'package:phrase_flow/components/flutter_flow/form_field_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpdateAccount extends StatefulWidget {
  const UpdateAccount({Key? key}) : super(key: key);

  @override
  _UpdateAccountState createState() => _UpdateAccountState();
}

class _UpdateAccountState extends State<UpdateAccount> {
  late AddAnotherProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddAnotherProfileModel());

    _model.phoneNumberController1 ??= TextEditingController();
    _model.phoneNumberFocusNode1 ??= FocusNode();
    _model.phoneNumberController2 ??= TextEditingController();
    _model.phoneNumberFocusNode2 ??= FocusNode();
    _model.phoneNumberController3 ??= TextEditingController();
    _model.phoneNumberFocusNode3 ??= FocusNode();
    _model.phoneNumberController4 ??= TextEditingController();
    _model.phoneNumberFocusNode4 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ThemeModeApp.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: ThemeModeApp.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            context.pop();
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: ThemeModeApp.of(context).primaryText,
            size: 32.0,
          ),
        ),
        title: Text(
          'Completar perfil',
          style: ThemeModeApp.of(context).headlineSmall,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 120.0,
                  height: 120.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/app_laucher_icon.png',
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        'Atualise sua foto',
                        textAlign: TextAlign.center,
                        style: ThemeModeApp.of(context).bodyMedium,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                  child: TextFormField(
                    controller: _model.phoneNumberController1,
                    focusNode: _model.phoneNumberFocusNode1,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'WhatsApp',
                      labelStyle: ThemeModeApp.of(context).bodyMedium.copyWith(
                            fontFamily: 'Outfit',
                            color: ThemeModeApp.of(context).accent1,
                          ),
                      hintText: 'Seu contato aqui',
                      hintStyle: ThemeModeApp.of(context).bodyMedium.copyWith(
                            fontFamily: 'Outfit',
                            color: ThemeModeApp.of(context).secondaryText,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor: ThemeModeApp.of(context).secondaryBackground,
                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 24.0, 20.0, 24.0),
                    ),
                    style: ThemeModeApp.of(context).bodyMedium.copyWith(
                          fontFamily: 'Outfit',
                          color: ThemeModeApp.of(context).secondaryText,
                        ),
                    validator: _model.phoneNumberController1Validator
                        .asValidator(context),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                  child: TextFormField(
                    controller: _model.phoneNumberController2,
                    focusNode: _model.phoneNumberFocusNode2,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Idade',
                      labelStyle: ThemeModeApp.of(context).bodyMedium.copyWith(
                            fontFamily: 'Outfit',
                            color: ThemeModeApp.of(context).accent1,
                          ),
                      hintText: 'i.e. 34',
                      hintStyle: ThemeModeApp.of(context).bodyMedium.copyWith(
                            fontFamily: 'Outfit',
                            color: ThemeModeApp.of(context).primaryText,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor: ThemeModeApp.of(context).secondaryBackground,
                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 24.0, 20.0, 24.0),
                    ),
                    style: ThemeModeApp.of(context).bodyMedium.copyWith(
                          fontFamily: 'Outfit',
                          color: ThemeModeApp.of(context).secondaryText,
                        ),
                    keyboardType: TextInputType.number,
                    validator: _model.phoneNumberController2Validator
                        .asValidator(context),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                  child: TextFormField(
                    controller: _model.phoneNumberController3,
                    focusNode: _model.phoneNumberFocusNode3,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: ThemeModeApp.of(context).bodyMedium.copyWith(
                            fontFamily: 'Outfit',
                            color: ThemeModeApp.of(context).accent1,
                          ),
                      hintStyle: ThemeModeApp.of(context).bodyMedium.copyWith(
                            fontFamily: 'Outfit',
                            color: ThemeModeApp.of(context).secondaryText,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor: ThemeModeApp.of(context).secondaryBackground,
                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 24.0, 20.0, 24.0),
                    ),
                    style: ThemeModeApp.of(context).bodyMedium.copyWith(
                          fontFamily: 'Outfit',
                          color: ThemeModeApp.of(context).primaryText,
                        ),
                    validator: _model.phoneNumberController3Validator
                        .asValidator(context),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                  child: TextFormField(
                    controller: _model.phoneNumberController4,
                    focusNode: _model.phoneNumberFocusNode4,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Location',
                      labelStyle: ThemeModeApp.of(context).bodyMedium.copyWith(
                            fontFamily: 'Outfit',
                            color: ThemeModeApp.of(context).accent1,
                          ),
                      hintText:
                          'Rua, Joaquim Gonçalves, 1231, Centro - Itajubá',
                      hintStyle: ThemeModeApp.of(context).bodyMedium.copyWith(
                            fontFamily: 'Outfit',
                            color: ThemeModeApp.of(context).secondaryText,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor: ThemeModeApp.of(context).secondaryBackground,
                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 24.0, 20.0, 24.0),
                    ),
                    style: ThemeModeApp.of(context).bodyMedium.copyWith(
                          fontFamily: 'Outfit',
                          color: ThemeModeApp.of(context).primaryText,
                        ),
                    keyboardType: TextInputType.streetAddress,
                    validator: _model.phoneNumberController4Validator
                        .asValidator(context),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Como podemos te chamar ?',
                        style: ThemeModeApp.of(context).bodyMedium,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: FlutterFlowRadioButton(
                              options: ['Dele', 'Dela', 'Dele/Dela'].toList(),
                              onChanged: (val) => setState(() {}),
                              controller: _model.radioButtonValueController ??=
                                  FormFieldController<String>(null),
                              optionHeight: 25.0,
                              textStyle: ThemeModeApp.of(context).bodySmall,
                              selectedTextStyle: ThemeModeApp.of(context)
                                  .titleSmall
                                  .copyWith(
                                    fontFamily: 'Outfit',
                                    color: ThemeModeApp.of(context).primaryText,
                                  ),
                              textPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              buttonPosition: RadioButtonPosition.left,
                              direction: Axis.horizontal,
                              radioButtonColor:
                                  ThemeModeApp.of(context).primary,
                              inactiveRadioButtonColor:
                                  ThemeModeApp.of(context).accent1,
                              toggleable: false,
                              horizontalAlignment: WrapAlignment.center,
                              verticalAlignment: WrapCrossAlignment.start,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('homePage');
                    },
                    text: 'Completar Cadastro',
                    options: FFButtonOptions(
                      width: 230.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: ThemeModeApp.of(context).primary,
                      textStyle: ThemeModeApp.of(context).titleSmall.copyWith(
                            fontFamily: 'Outfit',
                            color: ThemeModeApp.of(context).primaryText,
                          ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
