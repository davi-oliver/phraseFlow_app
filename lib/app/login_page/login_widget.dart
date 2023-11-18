import 'dart:developer' as loggerger;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phrase_flow/app/global/global_functions.dart';
import 'package:phrase_flow/app/global/routes.dart';
import 'package:phrase_flow/app/global/store/global_store.dart';
import 'package:phrase_flow/app/global/theme/theme_mode.dart';
import 'package:phrase_flow/app/login_page/login_functions.dart';
import 'package:phrase_flow/backend/users.dart';
import 'package:phrase_flow/components/flutter_flow/flutter_flow_util.dart';
import 'package:phrase_flow/components/flutter_flow/flutter_flow_widgets.dart';
import 'package:phrase_flow/model/user.dart';
import 'package:provider/provider.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  inituser() async {
    final local = await LocalPath().users;
    // await local.delete();
    if (!await local.exists()) await local.writeAsString(jsonEncode(usersBD));

    var localStore;
    if (await local.exists()) {
      localStore = jsonDecode(await local.readAsString());
      localStore.add(usersBD);
      await local.writeAsString(jsonEncode(localStore));
    }

    loggerger.log("yuser local path: ${await local.readAsString()}");
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    _model.emailAddressController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();
    _model.passwordController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    inituser();
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
    final globalInfo = Provider.of<GlobalStore>(context, listen: false);

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: ThemeModeApp.of(context).primaryBackground,
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
                    color: ThemeModeApp.of(context).primaryBackground,
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
                            color: ThemeModeApp.of(context).primaryBackground,
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
                              'PhraseFlow.io',
                              style: ThemeModeApp.of(context)
                                  .displaySmall
                                  .copyWith(
                                    fontSize: 36.0,
                                    fontWeight: FontWeight.w600,
                                  ),
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
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Phrase',
                                        style: ThemeModeApp.of(context)
                                            .headlineLarge
                                            .copyWith(
                                              fontFamily: 'Urbanist',
                                              fontSize: 32.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Text(
                                        '.Flow',
                                        style: ThemeModeApp.of(context)
                                            .headlineLarge
                                            .copyWith(
                                              color: Color(0xFF1F09E3),
                                            ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 24.0),
                                    child: Text(
                                      'Vamos começar pelo formulário abaixo',
                                      style: ThemeModeApp.of(context)
                                          .labelMedium
                                          .copyWith(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: ThemeModeApp.of(context)
                                                .secondaryText,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller:
                                            _model.emailAddressController,
                                        focusNode: _model.emailAddressFocusNode,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.email],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Email',
                                          labelStyle: ThemeModeApp.of(context)
                                              .labelLarge
                                              .copyWith(
                                                fontFamily: 'Plus Jakarta Sans',
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: ThemeModeApp.of(context)
                                                  .lineColor,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF4B39EF),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFFF5963),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFFF5963),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          filled: true,
                                          fillColor: ThemeModeApp.of(context)
                                              .primaryBackground,
                                        ),
                                        style: ThemeModeApp.of(context)
                                            .bodyLarge
                                            .copyWith(
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: _model
                                            .emailAddressControllerValidator
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
                                        controller: _model.passwordController,
                                        focusNode: _model.passwordFocusNode,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.password],
                                        obscureText: !_model.passwordVisibility,
                                        decoration: InputDecoration(
                                          labelText: 'Senha',
                                          labelStyle: ThemeModeApp.of(context)
                                              .labelLarge
                                              .copyWith(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Color(0xFF57636C),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: ThemeModeApp.of(context)
                                                  .lineColor,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF4B39EF),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFFF5963),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFFF5963),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          filled: true,
                                          fillColor: ThemeModeApp.of(context)
                                              .secondaryBackground,
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
                                              color: Color(0xFF57636C),
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                        style: ThemeModeApp.of(context)
                                            .bodyLarge
                                            .copyWith(
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        validator: _model
                                            .passwordControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        final local = await LocalPath().users;

                                        if (await local.exists()) {
                                          var response = jsonDecode(
                                              await local.readAsString());
                                          loggerger.log("runtype $response");

                                          // verificar se o email existe e se a senha é igual
                                          var result = response.where(
                                              (element) =>
                                                  element["email"] ==
                                                      _model
                                                          .emailAddressController
                                                          .text &&
                                                  element["password"] ==
                                                      _model.passwordController
                                                          .text);

                                          if (result.isNotEmpty) {
                                            // set globaluser
                                            var user = result.first;
                                            globalInfo.setUser(ModelUser(
                                                id: user["id"],
                                                name: user["name"],
                                                email: user["email"],
                                                password: user["password"],
                                                birthDate: user["birthDate"],
                                                country: user["country"],
                                                sex: user["sex"]));

                                            return context.pushNamed(
                                                '$acompanhamenttodasatividades');
                                          } else {
                                            return ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor:
                                                    ThemeModeApp.of(context)
                                                        .primaryBackground,
                                                content: Text(
                                                    "Não foi possivel entrar com esses dados. Por favor, verifique os dados e tente novamente",
                                                    style:
                                                        ThemeModeApp.of(context)
                                                            .bodyLarge
                                                            .copyWith()),
                                              ),
                                            );
                                          }
                                        }
                                        return ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            backgroundColor:
                                                ThemeModeApp.of(context)
                                                    .primaryBackground,
                                            content: Text(
                                                "Não foi possivel entrar com esses dados. Por favor, verifique os dados e tente novamente",
                                                style: ThemeModeApp.of(context)
                                                    .bodyLarge
                                                    .copyWith()),
                                          ),
                                        );

                                        // final httprequest =
                                        //     PostHttpRequestApp(context);

                                        // final result = await httprequest
                                        //     .makeJsonRequestDynamc(
                                        //         url: "users/login",
                                        //         params: {
                                        //       "email": _model
                                        //           .emailAddressController.text,
                                        //       "password": _model
                                        //           .passwordController.text,
                                        //     });

                                        // Result res =
                                        //     await result.fold((l) async {
                                        //   return Result(false,
                                        //       message: l.descricao);
                                        // }, (r) async {
                                        //   if (r['error'] != null) {
                                        //     return Result(false,
                                        //         message: r['error']);
                                        //   }
                                        //   log("result: $r");

                                        //   globalInfo.setUser(ModelUser(
                                        //       id: r["id"],
                                        //       name: nameController.text,
                                        //       email:
                                        //           emailAddressController.text,
                                        //       password: passwordController.text,
                                        //       birthDate:
                                        //           controllerDataNasc.text,
                                        //       country:
                                        //           controllerNacionalidade.text,
                                        //       sex: r["sex"]));

                                        //   return Result(true,
                                        //       message: 'Sucesso');
                                        // });

                                        // if (res.isValid) {
                                        //   context.pushNamed(
                                        //       '$acompanhamenttodasatividades');
                                        // } else {
                                        //   ScaffoldMessenger.of(context)
                                        //       .showSnackBar(
                                        //     SnackBar(
                                        //       backgroundColor:
                                        //           ThemeModeApp.of(context)
                                        //               .primaryBackground,
                                        //       content: Text(
                                        //           "Não foi possivel entrar com esses dados. Por favor, verifique os dados e tente novamente",
                                        //           style:
                                        //               ThemeModeApp.of(context)
                                        //                   .bodyLarge
                                        //                   .copyWith()),
                                        //     ),
                                        //   );
                                        // }
                                      },
                                      text: 'Entrar',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 44.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF4B39EF),
                                        textStyle: ThemeModeApp.of(context)
                                            .titleSmall
                                            .copyWith(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
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
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 12.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context
                                                  .pushNamed('forgotPassword');
                                            },
                                            child: RichText(
                                              textScaleFactor:
                                                  MediaQuery.of(context)
                                                      .textScaleFactor,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'Esqueceu sua conta?',
                                                    style: TextStyle(),
                                                  ),
                                                  TextSpan(
                                                    text: 'Recupere já',
                                                    style: ThemeModeApp.of(
                                                            context)
                                                        .bodyMedium
                                                        .copyWith(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              Color(0xFF4B39EF),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  )
                                                ],
                                                style: ThemeModeApp.of(context)
                                                    .bodyMedium
                                                    .copyWith(
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
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
                                        color: ThemeModeApp.of(context)
                                            .secondaryBackground,
                                        textStyle: ThemeModeApp.of(context)
                                            .bodyLarge
                                            .copyWith(
                                              fontFamily: 'Plus Jakarta Sans',
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
                                          context.pushNamed('$createaccount');
                                        },
                                        child: RichText(
                                          textScaleFactor:
                                              MediaQuery.of(context)
                                                  .textScaleFactor,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Não criou sua conta?',
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: 'Crie já',
                                                style: ThemeModeApp.of(context)
                                                    .bodyMedium
                                                    .copyWith(
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      color: Color(0xFF4B39EF),
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              )
                                            ],
                                            style: ThemeModeApp.of(context)
                                                .bodyMedium
                                                .copyWith(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  // You will have to add an action on this rich text to go to your login page.
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
                          colors: [Color(0xFF4B39EF), Color(0xFF39D2C0)],
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
                                    ThemeModeApp.of(context).primaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    color: Color(0x2E000000),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Color(0xFFF1F4F8),
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
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          'https://i.redd.it/r309qbxachv71.jpg',
                                                          width: 300.0,
                                                          height: 40.0,
                                                          fit: BoxFit.fitHeight,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'UserName',
                                                style: ThemeModeApp.of(context)
                                                    .titleMedium
                                                    .copyWith(
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      color: Colors.white,
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                'Avaliação',
                                                style: ThemeModeApp.of(context)
                                                    .bodySmall
                                                    .copyWith(
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
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
                                                      '5',
                                                      style: ThemeModeApp.of(
                                                              context)
                                                          .headlineMedium
                                                          .copyWith(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            fontSize: 24.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.star_rounded,
                                                    color: Color(0xFF4B39EF),
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
                                              'Este aplicativo de saúde e bem-estar tem sido uma adição incrível à minha vida. Ele oferece uma ampla gama de recursos que têm me ajudado a alcançar meus objetivos de maneira eficaz e a manter um estilo de vida saudável.',
                                              style: ThemeModeApp.of(context)
                                                  .bodyMedium
                                                  .copyWith(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
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
