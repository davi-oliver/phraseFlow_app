import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:phrase_flow/app/global/global_functions.dart';
import 'package:phrase_flow/app/global/routes.dart';
import 'package:phrase_flow/app/global/store/global_store.dart';
import 'package:phrase_flow/app/global/theme/theme_mode.dart';
import 'package:phrase_flow/app/home/home_widgets.dart';
import 'package:phrase_flow/app/home/store/home_store.dart';
import 'package:phrase_flow/app/services/add_lesson/add_lesson_model.dart';
import 'package:phrase_flow/app/services/questionary/store/store.dart';
import 'package:phrase_flow/components/flutter_flow/flutter_flow_util.dart';
import 'package:phrase_flow/components/flutter_flow/flutter_flow_widgets.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AddLesson extends StatefulWidget {
  const AddLesson({super.key});

  @override
  State<AddLesson> createState() => _AddLessonState();
}

class _AddLessonState extends State<AddLesson> {
  late AddLessonModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    _model = createModel(context, () => AddLessonModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                HomeWidgets(context).navebarSide(),
              if (responsiveVisibility(
                context: context,
              ))
                Expanded(
                  child: CorpoAdicionarLesson(),
                ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CorpoAdicionarLesson extends StatelessWidget {
  const CorpoAdicionarLesson({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<QuestionarioStore>(context, listen: false);
    final homeStore = Provider.of<HomeStore>(context, listen: false);
    final globalStore = Provider.of<GlobalStore>(context, listen: false);
    return Align(
      alignment: AlignmentDirectional(0.00, -1.00),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxWidth: 1170.0,
        ),
        decoration: BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 20.0, 0.0, 0.0),
                            child: Text(
                              "Olá, ${globalStore.user?.name! ?? "Nome"} ",
                              style: ThemeModeApp.of(context)
                                  .headlineMedium
                                  .copyWith(
                                    color: ThemeModeApp.of(context).primaryText,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 4.0, 0.0, 0.0),
                            child: Text(
                              "Seus idiomas",
                              textAlign: TextAlign.start,
                              style: ThemeModeApp.of(context)
                                  .labelMedium
                                  .copyWith(
                                    color:
                                        ThemeModeApp.of(context).secondaryText,
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

              if (responsiveVisibility(
                  context: context, phone: false, tablet: false))
                CardAdicionarLicao(),
              if (responsiveVisibility(
                context: context,
                phone: false,
                desktop: false,
                tabletLandscape: false,
              ))
                CardAdicionarLicao(),
              // // mobile
              if (responsiveVisibility(
                context: context,
                tablet: false,
                desktop: false,
                tabletLandscape: false,
              ))
                CardAdicionarLicao(),
            ],
          ),
        ),
      ),
    );
  }
}

class CardAdicionarLicao extends StatefulWidget {
  const CardAdicionarLicao({super.key});

  @override
  State<CardAdicionarLicao> createState() => _CardAdicionarLicaoState();
}

class _CardAdicionarLicaoState extends State<CardAdicionarLicao> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<QuestionarioStore>(context, listen: false);
    final homeStore = Provider.of<HomeStore>(context, listen: false);
    final globalStore = Provider.of<GlobalStore>(context, listen: false);
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/image-removebg-preview_(1).png",
                width: 50.0,
                height: 54.0,
                fit: BoxFit.cover,
              ),
              Text(
                "Qual idioma você deseja aprendender?",
                textAlign: TextAlign.start,
                style: ThemeModeApp.of(context).headlineSmall.copyWith(
                      color: ThemeModeApp.of(context).secondaryText,
                    ),
              ),
            ],
          ),
        ),
        Observer(builder: (_) {
          return Padding(
            padding: EdgeInsetsDirectional.fromSTEB(40.0, 20.0, 40.0, 0.0),
            child: DropdownButton(
              isExpanded: true,
              items: store.listAllLessons.map((language) {
                return DropdownMenuItem(
                  value: language,
                  child: Text(language.title!),
                );
              }).toList(),
              onChanged: (value) {
                // Faça algo quando uma opção for selec
                homeStore.setSelectIdioma(value!.title?.toString());
                homeStore.setSelectNivel(value.id.toString());
                print('Opção selecionada: $value');
              },
              hint: Text(
                '${homeStore.selectIdioma}',
                style: ThemeModeApp.of(context).headlineSmall,
              ),
            ),
          );
        }),
        FFButtonWidget(
          onPressed: () async {
            print('Button pressed ...');

            final local = await LocalPath().lessonsByUser;
            homeStore.clearListLessonUserCompleted();

            if (await local.exists()) {
              log("EXISTE LOCAL");
              var result = await jsonDecode(await local.readAsString());
              List listaAux = [];
              listaAux.addAll(result);

              for (var element in store.listAllLessons) {
                if (element.id.toString() == homeStore.selectNivel) {
                  listaAux.add(element.toJson());
                }
              }

              await local.writeAsString(jsonEncode(listaAux));
              log("listaAux aq $listaAux");
              await alertSucesso("Nova lição adicionada com sucesso!", () {
                Navigator.pop(context);
                context.pushNamed(acompanhamenttodasatividades);
              });
            } else {
              log("NAO EXISTE LOCAL");
              List listaAux = [];

              for (var element in store.listAllLessons) {
                if (element.id == homeStore.selectNivel) {
                  listaAux.add(element.toJson());
                }
              }

              await local.writeAsString(jsonEncode(listaAux));
              log("listaAux aaa $listaAux");
            }
          },
          text: 'Adicionar',
          options: FFButtonOptions(
            width: 130,
            height: 40,
            color: ThemeModeApp.of(context).primary,
            textStyle: ThemeModeApp.of(context).bodyLarge.copyWith(
                  color: ThemeModeApp.of(context).primaryBackground,
                  fontWeight: FontWeight.w500,
                ),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }

  alertSucesso(String texto, Function()? onPressed) {
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromLeft,
      isOverlayTapDismiss: false,
      isCloseButton: false,
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: ThemeModeApp.of(context).primaryBackground,
        ),
      ),
      titleStyle: ThemeModeApp.of(context).headlineSmall,
      descStyle: ThemeModeApp.of(context).bodyMedium,
      descTextAlign: TextAlign.center,
      isButtonVisible: true,
      overlayColor: Color(0x55000000),
    );

    return Alert(
      context: context,
      style: alertStyle,
      title: "Pronto!",
      desc: texto,
      image: Image.asset("assets/images/error_image.png"),
      buttons: [
        DialogButton(
          color: ThemeModeApp.of(context).primary,
          radius: BorderRadius.circular(15),
          onPressed: onPressed,
          child: Text(
            "Fechar",
            style: ThemeModeApp.of(context)
                .bodyMedium
                .copyWith(color: ThemeModeApp.of(context).primaryBtnText),
          ),
        ),
      ],
    ).show();
  }
}
