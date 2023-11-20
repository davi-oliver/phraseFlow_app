import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:phrase_flow/app/global/routes.dart';
import 'package:phrase_flow/app/global/store/global_store.dart';
import 'package:phrase_flow/app/global/theme/theme_mode.dart';
import 'package:phrase_flow/components/flutter_flow/flutter_flow_radio_button.dart';
import 'package:phrase_flow/components/flutter_flow/flutter_flow_util.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phrase_flow/components/flutter_flow/flutter_flow_widgets.dart';
import 'package:phrase_flow/components/flutter_flow/form_field_controller.dart';
import 'package:provider/provider.dart';

import '../../login_page/createaccount/createaccount_widget.dart';

TextEditingController updatenameController = TextEditingController();
TextEditingController updateemailAddressController = TextEditingController();
TextEditingController updatepasswordController = TextEditingController();
TextEditingController updatepasswordConfirmController = TextEditingController();
MaskedTextController updatecontrollerDataNasc =
    MaskedTextController(mask: '00/00/0000');
TextEditingController updatecontrollerNacionalidade = TextEditingController();
var sexo;

class UpdateAccount extends StatefulWidget {
  const UpdateAccount({Key? key}) : super(key: key);

  @override
  _UpdateAccountState createState() => _UpdateAccountState();
}

class _UpdateAccountState extends State<UpdateAccount> {
  late CreateaccountModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  initCampos() {
    final globalStore = Provider.of<GlobalStore>(context, listen: false);
    updatenameController.text = globalStore.user?.name ?? "";
    updateemailAddressController.text = globalStore.user?.email ?? "";
    updatecontrollerNacionalidade.text = globalStore.user?.country ?? "";
    updatecontrollerDataNasc.text = globalStore.user?.birthDate ?? "";
  }

  @override
  void initState() {
    super.initState();
    // _model.passwordConfirmFocusNode ??= FocusNode();
    _model = createModel(context, () => CreateaccountModel());
    initCampos();
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
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GestureDetector(
                          onTap: () => context.pop(),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios_rounded,
                                color: ThemeModeApp.of(context).primaryText,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Atualizar Conta",
                                style: ThemeModeApp.of(context).headlineLarge,
                              ),
                            ],
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    "Complete sua conta para começar a aprender",
                                    style: ThemeModeApp.of(context)
                                        .bodyMedium
                                        .copyWith(
                                          color: ThemeModeApp.of(context)
                                              .primaryText,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: TextFieldCustom(
                                    controller: updatenameController,
                                    name: "Nome",
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: TextFieldCustom(
                                    controller: updateemailAddressController,
                                    name: "Email",
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: TextFieldCustom(
                                    controller: updatecontrollerNacionalidade,
                                    name: "Nascionalidade",
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: TextFieldCustom(
                                    controller: updatecontrollerDataNasc,
                                    name: "Data nascimento",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 12.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Como podemos te chamar ?',
                              style: ThemeModeApp.of(context).headlineSmall,
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
                                    textStyle:
                                        ThemeModeApp.of(context).bodySmall,
                                    selectedTextStyle: ThemeModeApp.of(context)
                                        .titleSmall
                                        .copyWith(
                                          fontFamily: 'Outfit',
                                          color: ThemeModeApp.of(context)
                                              .primaryText,
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .1,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 16.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Result validate = await _model.validateSubmit();
                            if (validate.isValid) {
                              Result result = await createUser(context);
                              if (!result.isValid) {
                                return ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  SnackBar(
                                    backgroundColor: ThemeModeApp.of(context)
                                        .primaryBackground,
                                    content: Text("${result.message}",
                                        style: ThemeModeApp.of(context)
                                            .bodyLarge
                                            .copyWith(
                                              fontFamily: 'Outfit',
                                            )),
                                  ),
                                );
                              } else {
                                context
                                    .pushNamed('$acompanhamenttodasatividades');
                              }
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor:
                                    ThemeModeApp.of(context).primaryBackground,
                                content: Text("${validate.message}",
                                    style: ThemeModeApp.of(context)
                                        .bodyLarge
                                        .copyWith()),
                              ),
                            );
                          },
                          text: "Atualizar conta",
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 44.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: ThemeModeApp.of(context).primary,
                            textStyle: ThemeModeApp.of(context)
                                .titleMedium
                                .copyWith(
                                  color:
                                      ThemeModeApp.of(context).primaryBtnText,
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
}

class TextFieldCustom extends StatelessWidget {
  final controller;
  String? name;
  TextFieldCustom({required this.controller, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Container(
        width: double.infinity,
        child: TextFormField(
          controller: controller,
          obscureText: false,
          decoration: InputDecoration(
            labelText: name,
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
    );
  }
}
