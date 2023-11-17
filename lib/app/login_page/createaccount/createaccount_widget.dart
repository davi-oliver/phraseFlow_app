import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phrase_flow/app/global/routes.dart';
import 'package:phrase_flow/app/global/theme/theme_mode.dart';
import 'package:phrase_flow/app/login_page/login_functions.dart';
import 'package:phrase_flow/components/flutter_flow/flutter_flow_radio_button.dart';
import 'package:phrase_flow/components/flutter_flow/form_field_controller.dart';

import '../../../components/flutter_flow/flutter_flow_util.dart';
import '../../../components/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'createaccount_model.dart';
export 'createaccount_model.dart';

class CreateaccountWidget extends StatefulWidget {
  const CreateaccountWidget({Key? key}) : super(key: key);

  @override
  _CreateaccountWidgetState createState() => _CreateaccountWidgetState();
}

class _CreateaccountWidgetState extends State<CreateaccountWidget> {
  late CreateaccountModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateaccountModel());

    // // _model.emailAddressController ??= TextEditingController();
    // _model.emailAddressFocusNode ??= FocusNode();
    // _model.passwordController ??= TextEditingController();
    // _model.passwordFocusNode ??= FocusNode();
    // _model.passwordConfirmController ??= TextEditingController();
    // _model.passwordConfirmFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    nameController.dispose();
    emailAddressController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    controllerDataNasc.dispose();
    controllerNacionalidade.dispose();
    _model.controllerDataNascFocusNode?.dispose();
    _model.controllerNacionalidadeFocusNode?.dispose();
    _model.emailAddressFocusNode?.dispose();
    _model.nameControllerFocusNode?.dispose();
    _model.passwordConfirmFocusNode?.dispose();
    _model.passwordFocusNode?.dispose();

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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: ThemeModeApp.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  width: 100.0,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: ThemeModeApp.of(context).secondaryBackground,
                  ),
                  alignment: AlignmentDirectional(0.00, -1.00),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 140.0,
                          decoration: BoxDecoration(
                            color: ThemeModeApp.of(context).secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.0),
                              bottomRight: Radius.circular(16.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 0.0, 0.0),
                            child: Text(
                              "PhraseFlow.io",
                              style: ThemeModeApp.of(context).displaySmall,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            maxWidth: 430.0,
                          ),
                          decoration: BoxDecoration(
                            color: ThemeModeApp.of(context).secondaryBackground,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 24.0, 24.0, 24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Criar Conta",
                                    style:
                                        ThemeModeApp.of(context).headlineLarge,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 24.0),
                                    child: Text(
                                      "Vamos começar preenchendo o formulario",
                                      style: ThemeModeApp.of(context).bodyLarge,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: nameController,
                                        focusNode:
                                            _model.nameControllerFocusNode,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.email],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: "Nome",
                                          labelStyle: ThemeModeApp.of(context)
                                              .labelLarge,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  Color.fromARGB(255, 4, 7, 10),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: ThemeModeApp.of(context)
                                                  .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: ThemeModeApp.of(context)
                                                  .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: ThemeModeApp.of(context)
                                                  .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          filled: true,
                                          fillColor: ThemeModeApp.of(context)
                                              .primaryBackground,
                                        ),
                                        style:
                                            ThemeModeApp.of(context).bodyLarge,
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                  ),
                                  TextFieldEmail(model: _model),
                                  TextFieldDataNasc(
                                    model: _model,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 12.0, 20.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Como podemos te chamar ?',
                                          style: ThemeModeApp.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 12.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: FlutterFlowRadioButton(
                                                options: [
                                                  'Dele',
                                                  'Dela',
                                                  'Outro'
                                                ].toList(),
                                                onChanged: (val) =>
                                                    setState(() {
                                                  sexo = val;
                                                }),
                                                controller: _model
                                                        .radioButtonValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                optionHeight: 25.0,
                                                textStyle:
                                                    ThemeModeApp.of(context)
                                                        .bodySmall,
                                                selectedTextStyle:
                                                    ThemeModeApp.of(context)
                                                        .titleSmall
                                                        .copyWith(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              ThemeModeApp.of(
                                                                      context)
                                                                  .primaryText,
                                                        ),
                                                textPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(0.0, 0.0,
                                                            12.0, 0.0),
                                                buttonPosition:
                                                    RadioButtonPosition.left,
                                                direction: Axis.horizontal,
                                                radioButtonColor:
                                                    ThemeModeApp.of(context)
                                                        .primary,
                                                inactiveRadioButtonColor:
                                                    ThemeModeApp.of(context)
                                                        .accent1,
                                                toggleable: false,
                                                horizontalAlignment:
                                                    WrapAlignment.center,
                                                verticalAlignment:
                                                    WrapCrossAlignment.start,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 16.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: controllerNacionalidade,
                                        focusNode: _model
                                            .controllerNacionalidadeFocusNode,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.email],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: "Digite sua Nacionalidade",
                                          labelStyle: ThemeModeApp.of(context)
                                              .labelLarge,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  Color.fromARGB(255, 4, 7, 10),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          hintText: "Ex: Brasileiro",
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: ThemeModeApp.of(context)
                                                  .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: ThemeModeApp.of(context)
                                                  .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: ThemeModeApp.of(context)
                                                  .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          filled: true,
                                          fillColor: ThemeModeApp.of(context)
                                              .primaryBackground,
                                        ),
                                        style:
                                            ThemeModeApp.of(context).bodyLarge,
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: passwordController,
                                        focusNode: _model.passwordFocusNode,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.password],
                                        obscureText: !_model.passwordVisibility,
                                        decoration: InputDecoration(
                                          labelText: "Senha",
                                          labelStyle: ThemeModeApp.of(context)
                                              .labelLarge,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  Color.fromARGB(255, 4, 7, 10),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: ThemeModeApp.of(context)
                                                  .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: ThemeModeApp.of(context)
                                                  .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: ThemeModeApp.of(context)
                                                  .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          filled: true,
                                          fillColor: ThemeModeApp.of(context)
                                              .primaryBackground,
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => _model.passwordVisibility =
                                                  !_model.passwordVisibility,
                                            ),
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: Icon(
                                              _model.passwordVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              color: ThemeModeApp.of(context)
                                                  .secondaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                        style:
                                            ThemeModeApp.of(context).bodyLarge,
                                        validator: _model
                                            .passwordControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: passwordConfirmController,
                                        focusNode:
                                            _model.passwordConfirmFocusNode,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.password],
                                        obscureText:
                                            !_model.passwordConfirmVisibility,
                                        decoration: InputDecoration(
                                          labelText: "Confirmar Senha",
                                          labelStyle: ThemeModeApp.of(context)
                                              .labelLarge,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  Color.fromARGB(255, 4, 7, 10),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: ThemeModeApp.of(context)
                                                  .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: ThemeModeApp.of(context)
                                                  .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: ThemeModeApp.of(context)
                                                  .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          filled: true,
                                          fillColor: ThemeModeApp.of(context)
                                              .primaryBackground,
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => _model
                                                      .passwordConfirmVisibility =
                                                  !_model
                                                      .passwordConfirmVisibility,
                                            ),
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: Icon(
                                              _model.passwordConfirmVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              color: ThemeModeApp.of(context)
                                                  .secondaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                        style:
                                            ThemeModeApp.of(context).bodyLarge,
                                        minLines: 1,
                                        validator: _model
                                            .passwordConfirmControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        Result validate =
                                            await _model.validateSubmit();
                                        if (validate.isValid) {
                                          Result result =
                                              await createUser(context);
                                          if (!result.isValid) {
                                            return ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor:
                                                    ThemeModeApp.of(context)
                                                        .primaryBackground,
                                                content: Text(
                                                    "${result.message}",
                                                    style:
                                                        ThemeModeApp.of(context)
                                                            .bodyLarge
                                                            .copyWith(
                                                              fontFamily:
                                                                  'Outfit',
                                                            )),
                                              ),
                                            );
                                          } else {
                                            context.pushNamed(
                                                '$acompanhamenttodasatividades');
                                          }
                                        }

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            backgroundColor:
                                                ThemeModeApp.of(context)
                                                    .primaryBackground,
                                            content: Text("${validate.message}",
                                                style: ThemeModeApp.of(context)
                                                    .bodyLarge
                                                    .copyWith()),
                                          ),
                                        );
                                      },
                                      text: "Criar Conta",
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 44.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: ThemeModeApp.of(context).primary,
                                        textStyle: ThemeModeApp.of(context)
                                            .titleMedium
                                            .copyWith(
                                              color: ThemeModeApp.of(context)
                                                  .primaryBtnText,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          color: ThemeModeApp.of(context)
                                              .secondaryText,
                                          thickness: 1.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: Text(
                                          "ou",
                                          style: ThemeModeApp.of(context)
                                              .bodyMedium
                                              .copyWith(
                                                color: ThemeModeApp.of(context)
                                                    .secondaryText,
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Divider(
                                          color: ThemeModeApp.of(context)
                                              .secondaryText,
                                          thickness: 1.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 16.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        var resp = await LoginFunctions(context)
                                            .signInGoogle();
                                        if (resp) {
                                          context.pushNamed(
                                              '$acompanhamenttodasatividades');
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              backgroundColor:
                                                  ThemeModeApp.of(context)
                                                      .primaryBackground,
                                              content: Text(
                                                  "Erro ao logar com o Google",
                                                  style:
                                                      ThemeModeApp.of(context)
                                                          .bodyLarge
                                                          .copyWith()),
                                            ),
                                          );
                                        }
                                      },
                                      text: 'Continue com Google',
                                      icon: FaIcon(
                                        FontAwesomeIcons.google,
                                        size: 20.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 44.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Colors.white,
                                        textStyle: ThemeModeApp.of(context)
                                            .titleSmall
                                            .copyWith(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Color(0xFF101213),
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Color(0xFFE0E3E7),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        hoverColor: Color(0xFFF1F4F8),
                                      ),
                                    ),
                                  ),

                                  // You will have to add an action on this rich text to go to your login page.
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 12.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('$loginPage');
                                        },
                                        child: RichText(
                                          textScaleFactor:
                                              MediaQuery.of(context)
                                                  .textScaleFactor,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Já possui conta?",
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: "Entre aqui",
                                                style: ThemeModeApp.of(context)
                                                    .bodyMedium
                                                    .copyWith(
                                                      color: ThemeModeApp.of(
                                                              context)
                                                          .primary,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              )
                                            ],
                                            style: ThemeModeApp.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: Container(
                      width: 100.0,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            ThemeModeApp.of(context).info,
                            ThemeModeApp.of(context).primary
                          ],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(1.0, -1.0),
                          end: AlignmentDirectional(-1.0, 1.0),
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 24.0, 24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              constraints: BoxConstraints(
                                maxWidth: 400.0,
                              ),
                              decoration: BoxDecoration(
                                color: ThemeModeApp.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    color: Color(0x2E000000),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: ThemeModeApp.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 4.0, 4.0, 4.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 12.0, 12.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
                                                child: Container(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/WhatsApp_Image_2023-08-31_at_21.37.07-removebg-preview.png',
                                                      width: 300.0,
                                                      height: 200.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Phrase Flow",
                                                style: ThemeModeApp.of(context)
                                                    .titleMedium,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "Avaliação",
                                                style: ThemeModeApp.of(context)
                                                    .bodySmall,
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: Text(
                                                      "5",
                                                      style: ThemeModeApp.of(
                                                              context)
                                                          .headlineMedium,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.star_rounded,
                                                    color:
                                                        ThemeModeApp.of(context)
                                                            .primary,
                                                    size: 20.0,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: AutoSizeText(
                                              "Este aplicativo de idiomas tem sido uma adição incrível à minha vida. Ele oferece uma ampla gama de recursos que têm me ajudado a alcançar meus objetivos de maneira eficaz.",
                                              style: ThemeModeApp.of(context)
                                                  .bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldDataNasc extends StatelessWidget {
  const TextFieldDataNasc({
    super.key,
    required CreateaccountModel model,
  }) : _model = model;

  final CreateaccountModel _model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Container(
        width: double.infinity,
        child: TextFormField(
          controller: controllerDataNasc,
          focusNode: _model.controllerDataNascFocusNode,
          autofocus: true,
          autofillHints: [AutofillHints.email],
          obscureText: false,
          decoration: InputDecoration(
            labelText: "Data de Nascimento",
            labelStyle: ThemeModeApp.of(context).labelLarge,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 4, 7, 10),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ThemeModeApp.of(context).primary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ThemeModeApp.of(context).error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ThemeModeApp.of(context).error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            filled: true,
            fillColor: ThemeModeApp.of(context).primaryBackground,
          ),
          style: ThemeModeApp.of(context).bodyLarge,
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}

class TextFieldEmail extends StatelessWidget {
  const TextFieldEmail({
    super.key,
    required CreateaccountModel model,
  }) : _model = model;

  final CreateaccountModel _model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Container(
        width: double.infinity,
        child: TextFormField(
          controller: emailAddressController,
          focusNode: _model.emailAddressFocusNode,
          autofocus: true,
          autofillHints: [AutofillHints.email],
          obscureText: false,
          decoration: InputDecoration(
            labelText: "Email",
            labelStyle: ThemeModeApp.of(context).labelLarge,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 4, 7, 10),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ThemeModeApp.of(context).primary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ThemeModeApp.of(context).error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ThemeModeApp.of(context).error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            filled: true,
            fillColor: ThemeModeApp.of(context).primaryBackground,
          ),
          style: ThemeModeApp.of(context).bodyLarge,
          keyboardType: TextInputType.emailAddress,
          validator:
              _model.emailAddressControllerValidator.asValidator(context),
        ),
      ),
    );
  }
}
