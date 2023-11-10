import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:phrase_flow/app/global/routes.dart';
import 'package:phrase_flow/app/global/store/global_store.dart';
import 'package:phrase_flow/app/global/theme/theme_mode.dart';
import 'package:phrase_flow/app/home/home_widgets.dart';
import 'package:phrase_flow/app/home/store/home_store.dart';
import 'package:phrase_flow/app/services/add_lesson/add_lesson_model.dart';
import 'package:phrase_flow/components/flutter_flow/flutter_flow_util.dart';
import 'package:phrase_flow/components/flutter_flow/flutter_flow_widgets.dart';
import 'package:provider/provider.dart';

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
                HomePageLandScapeDesktop(),
              if (responsiveVisibility(
                context: context,
                phone: false,
                desktop: false,
                tabletLandscape: false,
              ))
                HomePageTablet(),
              // // mobile
              if (responsiveVisibility(
                context: context,
                tablet: false,
                desktop: false,
                tabletLandscape: false,
              ))
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                              style: ThemeModeApp.of(context)
                                  .labelMedium
                                  .copyWith(
                                    color:
                                        ThemeModeApp.of(context).secondaryText,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 30.0, 0.0, 0.0),
                        child: Text(
                          "Selecione um idioma para começar",
                          textAlign: TextAlign.start,
                          style: ThemeModeApp.of(context)
                              .headlineSmall
                              .copyWith(
                                color: ThemeModeApp.of(context).secondaryText,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Observer(builder: (_) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButton<String>(
                                  value: homeStore.selectIdioma,
                                  onChanged: (String? newValue) {
                                    homeStore.setSelectIdioma(newValue);
                                  },
                                  style: ThemeModeApp.of(context).bodyLarge,
                                  icon: Icon(
                                    Icons.arrow_drop_down, // Ícone dropdown
                                    color: Colors.blue,
                                  ),
                                  elevation: 16, // Elevação do dropdown
                                  underline: Container(
                                      height: 2,
                                      color: ThemeModeApp.of(context)
                                          .lineColor // Cor da linha abaixo do dropdown
                                      ),
                                  items: <String>[
                                    'Básico',
                                    'Intermediário',
                                    'Avançado',
                                    'Fluente'
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          fontSize:
                                              16.0, // Tamanho do texto das opções
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                        child: Text(
                          "O quão bem você fala esse idioma?",
                          textAlign: TextAlign.start,
                          style: ThemeModeApp.of(context)
                              .headlineSmall
                              .copyWith(
                                color: ThemeModeApp.of(context).secondaryText,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Observer(builder: (_) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButton<String>(
                                  value: homeStore.selectIdioma,
                                  onChanged: (String? newValue) {
                                    homeStore.setSelectIdioma(newValue);
                                  },
                                  style: ThemeModeApp.of(context).bodyLarge,
                                  icon: Icon(
                                    Icons.arrow_drop_down, // Ícone dropdown
                                    color: Colors.blue,
                                  ),
                                  elevation: 16, // Elevação do dropdown
                                  underline: Container(
                                      height: 2,
                                      color: ThemeModeApp.of(context)
                                          .lineColor // Cor da linha abaixo do dropdown
                                      ),
                                  items: <String>[
                                    'Básico',
                                    'Intermediário',
                                    'Avançado',
                                    'Fluente'
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          fontSize:
                                              16.0, // Tamanho do texto das opções
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                          context.pushReplacementNamed(
                              acompanhamenttodasatividades);
                        },
                        text: 'Adicionar',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: ThemeModeApp.of(context).primary,
                          textStyle: ThemeModeApp.of(context)
                              .bodyLarge
                              .copyWith(
                                color:
                                    ThemeModeApp.of(context).primaryBackground,
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
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
