import 'package:auto_size_text/auto_size_text.dart';
import 'package:phrase_flow/app/global/theme/theme_mode.dart';
import 'package:phrase_flow/components/flutter_flow/flutter_flow_radio_button.dart';
import 'package:phrase_flow/components/flutter_flow/flutter_flow_util.dart';
import 'package:phrase_flow/components/flutter_flow/flutter_flow_widgets.dart';
import 'package:phrase_flow/components/flutter_flow/form_field_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../login_page/createaccount/createaccount_widget.dart';

class UpdateAccount extends StatefulWidget {
  const UpdateAccount({Key? key}) : super(key: key);

  @override
  _UpdateAccountState createState() => _UpdateAccountState();
}

class _UpdateAccountState extends State<UpdateAccount> {
  late CreateaccountModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateaccountModel());
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
        child: Row(
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
                    child: Body(context))),
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
                              color:
                                  ThemeModeApp.of(context).secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3.0,
                                  color: Color(0x2E000000),
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color:
                                    ThemeModeApp.of(context).primaryBackground,
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
                                                  .fromSTEB(0.0, 0.0, 8.0, 0.0),
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: Text(
                                                    "5",
                                                    style:
                                                        ThemeModeApp.of(context)
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
    );
  }

  Padding Body(BuildContext context) {
    return Padding(
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
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: nameController,
                        focusNode: _model.nameControllerFocusNode,
                        autofocus: true,
                        autofillHints: [AutofillHints.email],
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: "Nome",
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
                      ),
                    ),
                  ),
                  TextFieldEmail(model: _model),
                  TextFieldDataNasc(
                    model: _model,
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
                                options: ['Dele', 'Dela', 'Outro'].toList(),
                                onChanged: (val) => setState(() {
                                  sexo = val;
                                }),
                                controller:
                                    _model.radioButtonValueController ??=
                                        FormFieldController<String>(null),
                                optionHeight: 25.0,
                                textStyle: ThemeModeApp.of(context).bodySmall,
                                selectedTextStyle: ThemeModeApp.of(context)
                                    .titleSmall
                                    .copyWith(
                                      fontFamily: 'Outfit',
                                      color:
                                          ThemeModeApp.of(context).primaryText,
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 16.0),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: controllerNacionalidade,
                        focusNode: _model.controllerNacionalidadeFocusNode,
                        autofocus: true,
                        autofillHints: [AutofillHints.email],
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: "Digite sua Nacionalidade",
                          labelStyle: ThemeModeApp.of(context).labelLarge,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 4, 7, 10),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          hintText: "Ex: Brasileiro",
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
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
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
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => _model.passwordVisibility =
                                  !_model.passwordVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              _model.passwordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: ThemeModeApp.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                        style: ThemeModeApp.of(context).bodyLarge,
                        validator: _model.passwordControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: passwordConfirmController,
                        focusNode: _model.passwordConfirmFocusNode,
                        autofocus: true,
                        autofillHints: [AutofillHints.password],
                        obscureText: !_model.passwordConfirmVisibility,
                        decoration: InputDecoration(
                          labelText: "Confirmar Senha",
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
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => _model.passwordConfirmVisibility =
                                  !_model.passwordConfirmVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              _model.passwordConfirmVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: ThemeModeApp.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                        style: ThemeModeApp.of(context).bodyLarge,
                        minLines: 1,
                        validator: _model.passwordConfirmControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('acompanhamenttodasatividades');
                      },
                      text: "Salvar Dados",
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 44.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: ThemeModeApp.of(context).primary,
                        textStyle: ThemeModeApp.of(context)
                            .titleMedium
                            .copyWith(
                              color: ThemeModeApp.of(context).primaryBtnText,
                            ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
